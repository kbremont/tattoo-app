package main

import (
	"context"

	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
	coreapp "github.com/kbremont/tattoo-app/internal/app"
	"github.com/kbremont/tattoo-app/internal/app/server"
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

func newApp(ctx context.Context) (*app, error) {
	// TODO: setup logger

	srv, err := newServer(ctx)
	if err != nil {
		// TODO: log error
		return nil, err
	}

	return &app{server: srv}, nil
}

func newServer(ctx context.Context) (*server.Server, error) {
	svc := coreapp.NewUserService(ctx)
	path, handler := pbconnect.NewUserServiceHandler(svc)

	return server.New(ctx, path, handler)
}
