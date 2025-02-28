package main

import (
	"context"

	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
	coreapp "github.com/kbremont/tattoo-app/internal/app"
	"github.com/kbremont/tattoo-app/internal/app/server"
	"github.com/kbremont/tattoo-app/internal/pkg/config"
	"github.com/kbremont/tattoo-app/internal/pkg/log"
	"github.com/kbremont/tattoo-app/internal/pkg/log/zap"
)

type app struct {
	logger log.Logger
	server *server.Server
}

func (a *app) start(ctx context.Context) error {
	a.logger.Info(ctx, "starting app server")
	if err := a.server.Serve(ctx); err != nil {
		a.logger.Error(ctx, "app startup failed", log.Error(err))
		return err
	}

	a.logger.Info(ctx, "app started")
	return nil
}

func (a *app) shutdown(ctx context.Context) {
	if err := a.server.Shutdown(ctx); err != nil {
		a.logger.Error(ctx, "error shutting down server", log.Error(err))
	}

	a.logger.Info(ctx, "app shut down")
}

func newApp(ctx context.Context, cfg *config.Config) (*app, error) {
	logger, err := zap.NewLogger(zap.WithContextKeyLogging([]zap.ContextKey{zap.RequestIDKey, zap.UserAgentKey}))
	// logger, err := zap.NewLogger()
	if err != nil {
		return nil, err
	}

	srv, err := newServer(ctx, cfg, logger)
	if err != nil {
		logger.Error(ctx, "unable to create app", log.Error(err))
		return nil, err
	}

	logger.Info(ctx, "app created")
	return &app{logger: logger, server: srv}, nil
}

func newServer(ctx context.Context, cfg *config.Config, l log.Logger) (*server.Server, error) {
	svc := coreapp.NewUserService(l)
	path, handler := pbconnect.NewUserServiceHandler(svc)

	srvCfg := &server.Config{
		Port: cfg.ServicePort,
	}

	return server.New(ctx, path, handler, srvCfg, l)
}
