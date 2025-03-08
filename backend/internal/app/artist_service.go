package app

import (
	"context"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
)

// ArtistService is the implementation of tattooapp.v1.ArtistService.
type ArtistService struct {
	repository ArtistRepository
}

// ArtistRepository is the interface that allows stateful operations on an artist.
type ArtistRepository interface {
	CreateArtist(ctx context.Context, a *v1pb.Artist) (*v1pb.Artist, error)
}

var _ pbconnect.ArtistServiceHandler = new(ArtistService)

func NewArtistService(ctx context.Context, repo ArtistRepository) *ArtistService {
	return &ArtistService{repository: repo}
}

// LinkInstagramAccount implements tattooapp.v1.ArtistService.LinkInstagramAccount.
func (s *ArtistService) LinkInstagramAccount(ctx context.Context, req *connect.Request[v1pb.LinkInstagramAccountRequest]) (*connect.Response[v1pb.LinkInstagramAccountResponse], error) {
	return connect.NewResponse(&v1pb.LinkInstagramAccountResponse{}), nil
}

// CreateArtist implements tattooapp.v1.ArtistService.CreateArtist.
func (s *ArtistService) CreateArtist(ctx context.Context, req *connect.Request[v1pb.CreateArtistRequest]) (*connect.Response[v1pb.CreateArtistResponse], error) {
	a, err := s.repository.CreateArtist(ctx, &v1pb.Artist{User: &v1pb.User{UserId: req.Msg.UserId}, Style: req.Msg.Style})
	if err != nil {
		return nil, err
	}

	return connect.NewResponse(&v1pb.CreateArtistResponse{ArtistId: a.ArtistId}), nil
}
