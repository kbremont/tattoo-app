package main

import (
	"context"
	"database/sql"

	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
	coreapp "github.com/kbremont/tattoo-app/internal/app"
	"github.com/kbremont/tattoo-app/internal/app/database"
	"github.com/kbremont/tattoo-app/internal/app/server"
	"github.com/kbremont/tattoo-app/internal/pkg/config"
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
	srv, err := newServer(ctx, cfg)
	if err != nil {
		// TODO: log error
		return nil, err
	}

	return &app{database: db, server: srv}, nil
}

func newServer(ctx context.Context, cfg *config.Config) (*server.Server, error) {
	svc := coreapp.NewUserService(ctx)
	path, handler := pbconnect.NewUserServiceHandler(svc)

	srvCfg := &server.Config{
		Port: cfg.ServicePort,
	}

	return server.New(ctx, path, handler, srvCfg)
}
