package main

import (
	"context"

	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
	coreapp "github.com/kbremont/tattoo-app/internal/app"
	"github.com/kbremont/tattoo-app/internal/app/server"
	"github.com/kbremont/tattoo-app/internal/pkg/config"
)

type app struct {
	server *server.Server
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

	srv, err := newServer(ctx, cfg)
	if err != nil {
		// TODO: log error
		return nil, err
	}

	return &app{server: srv}, nil
}

func newServer(ctx context.Context, cfg *config.Config) (*server.Server, error) {
	svc := coreapp.NewArtistService(ctx)
	path, handler := pbconnect.NewArtistServiceHandler(svc)

	srvCfg := &server.Config{
		Port: cfg.ServicePort,
	}

	return server.New(ctx, path, handler, srvCfg)
}
