package main

import (
	"context"
	"net/http"

	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
	app "github.com/kbremont/tattoo-app/internal/app"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
)

func main() {
	var ctx = context.Background()

	userService, err := app.NewUserService(ctx)
	if err != nil {
		panic(err)
	}

	artistService, err := app.NewArtistService(ctx)
	if err != nil {
		panic(err)
	}

	mux := http.NewServeMux()
	path, handler := pbconnect.NewUserServiceHandler(userService)
	mux.Handle(path, handler)

	path, handler = pbconnect.NewArtistServiceHandler(artistService)
	mux.Handle(path, handler)

	http.ListenAndServe("localhost:8080", h2c.NewHandler(mux, &http2.Server{}))
}
