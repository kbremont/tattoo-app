package artist

import (
	"context"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/artist/v1"
	"github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/artist/v1/pbconnect"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/auth"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
)

type ArtistService struct {
	repository ArtistRepositoryInterface
	logger     log.Logger
}

var _ pbconnect.ArtistServiceHandler = new(ArtistService)

func NewArtistService(l log.Logger, repo ArtistRepositoryInterface) *ArtistService {
	return &ArtistService{logger: l, repository: repo}
}

func (s *ArtistService) CreateArtistProfile(ctx context.Context, req *connect.Request[v1pb.CreateArtistProfileRequest]) (*connect.Response[v1pb.CreateArtistProfileResponse], error) {
	logger := log.FromContext(ctx)

	if err := auth.EnsureSameUser(ctx, req.Msg.GetUserId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	logger.Info(ctx, "handling CreateArtistProfile request", "user_id", req.Msg.GetUserId())

	p := &models.ArtistProfile{
		UserID:     req.Msg.GetUserId(),
		Bio:        req.Msg.GetBio(),
		Location:   req.Msg.GetLocation(),
		TattooShop: req.Msg.GetTattooShop(),
	}

	if err := s.repository.CreateArtistProfile(ctx, p); err != nil {
		logger.WithError(err).Error(ctx, "failed to create artist profile", "user_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "artist profile created successfully", "user_id", req.Msg.GetUserId())
	return connect.NewResponse(&v1pb.CreateArtistProfileResponse{ArtistProfile: &v1pb.ArtistProfile{
		UserId:     p.UserID,
		Bio:        p.Bio,
		Location:   p.Location,
		TattooShop: p.TattooShop,
	}}), nil
}

func (s *ArtistService) GetArtistProfile(ctx context.Context, req *connect.Request[v1pb.GetArtistProfileRequest]) (*connect.Response[v1pb.GetArtistProfileResponse], error) {
	logger := log.FromContext(ctx)

	if err := auth.EnsureSameUser(ctx, req.Msg.GetUserId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	logger.Info(ctx, "handling GetArtistProfile request", "user_id", req.Msg.GetUserId())

	p, err := s.repository.GetArtistProfile(ctx, req.Msg.GetUserId())
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to get artist profile", "user_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	if p == nil {
		logger.Warn(ctx, "artist profile not found", "user_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodeNotFound, err)
	}

	logger.Info(ctx, "artist profile retrieved successfully", "user_id", req.Msg.GetUserId())
	return connect.NewResponse(&v1pb.GetArtistProfileResponse{ArtistProfile: &v1pb.ArtistProfile{
		UserId:     p.UserID,
		Bio:        p.Bio,
		Location:   p.Location,
		TattooShop: p.TattooShop,
	}}), nil
}

func (s *ArtistService) DeleteArtistProfile(ctx context.Context, req *connect.Request[v1pb.DeleteArtistProfileRequest]) (*connect.Response[v1pb.DeleteArtistProfileResponse], error) {
	logger := log.FromContext(ctx)

	if err := auth.EnsureSameUser(ctx, req.Msg.GetUserId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	logger.Info(ctx, "handling DeleteArtistProfile request", "user_id", req.Msg.GetUserId())

	if err := s.repository.DeleteArtistProfile(ctx, req.Msg.GetUserId()); err != nil {
		logger.WithError(err).Error(ctx, "failed to delete artist profile", "user_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "artist profile deleted successfully", "user_id", req.Msg.GetUserId())
	return connect.NewResponse(&v1pb.DeleteArtistProfileResponse{Success: true}), nil
}
