package server

import (
	"context"
	"fmt"
	"net/http"

	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
)

type (
	// Server is a Connect server.
	Server struct {
		// Serve starts the server.
		Serve func(ctx context.Context) error
		// Shutdown gracefully shuts down the server.
		Shutdown func(ctx context.Context) error

		server *http.Server
	}

	// Config stores configuration options for a Server.
	Config struct {
		// Port is the port on which the server will listen.
		Port int
	}
)

// New creates a new *Server.
func New(ctx context.Context, path string, handler http.Handler, cfg *Config) (*Server, error) {
	mux := http.NewServeMux()
	mux.Handle(path, handler)
	srv := &Server{
		server: &http.Server{
			Addr:    fmt.Sprintf(":%d", cfg.Port),
			Handler: h2c.NewHandler(mux, &http2.Server{}),
		},
	}

	srv.Serve = func(cctx context.Context) error {
		go func() {
			err := srv.server.ListenAndServe()
			if err != nil {
				// TODO: log error
				panic(err)
			}
		}()

		return nil
	}

	srv.Shutdown = func(cctx context.Context) error {
		err := srv.server.Shutdown(ctx)
		return err
	}

	return srv, nil
}
