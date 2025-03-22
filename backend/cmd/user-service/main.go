package main

import (
	"context"
	"embed"
	"os"
	"os/signal"
	"syscall"

	"github.com/kbremont/tattoo-app/backend/internal/pkg/config"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log/slog"
)

//go:embed migrations/*
var filesys embed.FS

func main() {
	ctx := context.Background()
	logger := slog.New()
	log.SetFallbackLogger(logger.(*slog.Logger))

	cfg, err := config.Parse(ctx)
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to parse config")
		panic(err)
	}

	logger.Info(ctx, "starting User Service", "config", cfg)
	app, err := newApp(ctx, cfg, logger)
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to create app")
		panic(err)
	}

	if cfg.MigrateMode { // run DB migrations and exit
		if err := app.migrate(ctx, cfg.MigrateDown); err != nil {
			logger.WithError(err).Error(ctx, "failed to run migrations")
			panic(err)
		}

		return
	}

	done := make(chan os.Signal, 1)
	signal.Notify(done, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

	if err := app.start(ctx); err != nil {
		logger.WithError(err).Error(ctx, "failed to start app")
		panic(err)
	}

	<-done // block until cancellation signal is received
	app.shutdown(ctx)
}
