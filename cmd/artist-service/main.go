package main

import (
	"context"
	"os"
	"os/signal"
	"syscall"

	"github.com/kbremont/tattoo-app/internal/pkg/config"
)

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

	done := make(chan os.Signal, 1)
	signal.Notify(done, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

	if err := app.start(ctx); err != nil {
		panic(err)
	}

	<-done // block until cancellation signal is received
	app.shutdown(ctx)
}
