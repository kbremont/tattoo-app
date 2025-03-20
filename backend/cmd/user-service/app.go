package main

import (
	"context"
	"database/sql"
	"log"

	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
	coreapp "github.com/kbremont/tattoo-app/backend/internal/app"
	"github.com/kbremont/tattoo-app/backend/internal/app/database"
	"github.com/kbremont/tattoo-app/backend/internal/app/server"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/config"
)

type app struct {
	server   *server.Server
	database *sql.DB
}

func (a *app) start(ctx context.Context) error {
	if err := a.server.Serve(ctx); err != nil {
		// TODO: log error
		return err
	}

	// TODO: log success
	return nil
}

func (a *app) shutdown(ctx context.Context) {
	if err := a.server.Shutdown(ctx); err != nil {
		// TODO: log error
		panic(err)
	}

	// TODO: log success
}

func (a *app) migrate(ctx context.Context, migrateDown bool) error {
	log.Println("starting db migrations")
	if err := database.Migrate(ctx, a.database, filesys, "migrations", migrateDown); err != nil {
		return err
	}

	return nil
}

func newApp(ctx context.Context, cfg *config.Config) (*app, error) {
	// TODO: setup logger

	// setting up DB
	maxPings := database.DefaultMaxPings
	pingInterval := database.DefaultPingInterval

	db, err := database.New(cfg.DatabaseURI, database.WithPingTimeout(maxPings, pingInterval))
	if err != nil {
		// TODO log error
		return nil, err
	}

	// setting up server
	srv, err := newServer(ctx, cfg, db)
	if err != nil {
		// TODO: log error
		return nil, err
	}

	return &app{database: db, server: srv}, nil
}

func newServer(ctx context.Context, cfg *config.Config, db *sql.DB) (*server.Server, error) {
	svc := coreapp.NewUserService(ctx, database.NewUserRepository(db))
	path, handler := pbconnect.NewUserServiceHandler(svc)

	srvCfg := &server.Config{
		Port: cfg.ServicePort,
	}

	return server.New(ctx, path, handler, srvCfg)
}
