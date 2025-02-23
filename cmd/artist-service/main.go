package main

import (
	"context"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	ctx := context.Background()

	app, err := newApp(ctx)
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
