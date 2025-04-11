package main

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/client/v1/pbconnect"
	"github.com/kbremont/tattoo-app/backend/internal/app/client"
	"github.com/kbremont/tattoo-app/backend/internal/app/database"
	"github.com/kbremont/tattoo-app/backend/internal/app/server"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/auth"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/config"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
)

type app struct {
	server   *server.Server
	database *sql.DB
	logger   log.Logger
}

func (a *app) start(ctx context.Context) error {
	a.logger.Info(ctx, "starting app server")
	if err := a.server.Serve(ctx); err != nil {
		a.logger.WithError(err).Error(ctx, "failed to start app server")
		return err
	}

	a.logger.Info(ctx, "app server started successfully")
	return nil
}

func (a *app) shutdown(ctx context.Context) {
	a.logger.Info(ctx, "shutting down app server")
	if err := a.server.Shutdown(ctx); err != nil {
		a.logger.WithError(err).Error(ctx, "failed to shutdown app server")
		panic(err)
	}

	a.logger.Info(ctx, "app server shutdown successfully")
}

func (a *app) migrate(ctx context.Context, migrateDown bool) error {
	a.logger.Info(ctx, "starting database migrations")
	if err := database.Migrate(ctx, a.database, filesys, "migrations", migrateDown); err != nil {
		return err
	}

	a.logger.Info(ctx, "database migrations completed successfully")
	return nil
}

func newApp(ctx context.Context, cfg *config.Config, logger log.Logger) (*app, error) {
	maxPings := database.DefaultMaxPings
	pingInterval := database.DefaultPingInterval

	logger.Info(ctx, "creating database connection", "db_uri", cfg.DatabaseURI)
	db, err := database.New(cfg.DatabaseURI, database.WithPingTimeout(maxPings, pingInterval))
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to create database", "uri", cfg.DatabaseURI)
		return nil, err
	}

	srv, err := newServer(ctx, cfg, logger, db)
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to create app")
		return nil, err
	}

	logger.Info(ctx, "app created successfully")
	return &app{logger: logger, database: db, server: srv}, nil
}

func newServer(ctx context.Context, cfg *config.Config, l log.Logger, db *sql.DB) (*server.Server, error) {
	svc := client.NewClientService(l, client.NewClientRepository(db))
	path, handler := pbconnect.NewClientServiceHandler(svc)

	srvCfg := &server.Config{
		Port: cfg.Port,
	}

	// Setup JWKS fetcher
	jwksURL := fmt.Sprintf("https://%s/.well-known/jwks.json", cfg.Auth0Domain)
	jwksFetcher := auth.NewJWKSFetcher(jwksURL)
	if err := jwksFetcher.FetchAndCache(ctx); err != nil {
		return nil, fmt.Errorf("failed to fetch JWKS: %w", err)
	}

	// Chain middlewares: Logger -> JWT -> Service Handler
	handler = log.LoggerMiddleware(l)(
		auth.JWTMiddleware(jwksFetcher, l)(handler),
	)

	return server.New(ctx, path, handler, srvCfg, l)
}
