package app

import (
	"context"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
)

// UserService is the implementation of tattooapp.v1.UserService.
type ArtistService struct{}

var _ pbconnect.ArtistServiceHandler = new(ArtistService)

func NewArtistService(ctx context.Context) (*ArtistService, error) {
	return &ArtistService{}, nil
}

// LinkInstagramAccount implements tattooapp.v1.ArtistService.LinkInstagramAccount.
func (s *ArtistService) LinkInstagramAccount(ctx context.Context, req *connect.Request[v1pb.LinkInstagramAccountRequest]) (*connect.Response[v1pb.LinkInstagramAccountResponse], error) {
	return connect.NewResponse(&v1pb.LinkInstagramAccountResponse{}), nil
}
