package main

import (
	"context"
	"embed"
	"log"
	"os"
	"os/signal"
	"syscall"

	"github.com/kbremont/tattoo-app/backend/internal/pkg/config"
)

//go:embed migrations/*
var filesys embed.FS

func main() {
	ctx := context.Background()

	cfg, err := config.Parse(ctx)
	if err != nil {
		panic(err)
	}

	app, err := newApp(ctx, cfg)
	if err != nil {
		panic(err)
	}

	if cfg.MigrateMode { // run DB migrations and exit
		if err := app.migrate(ctx, cfg.MigrateDown); err != nil {
			panic(err)
		}

		return
	}

	done := make(chan os.Signal, 1)
	signal.Notify(done, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

	log.Println("starting server")
	if err := app.start(ctx); err != nil {
		panic(err)
	}

	<-done // block until cancellation signal is received
	app.shutdown(ctx)
}
