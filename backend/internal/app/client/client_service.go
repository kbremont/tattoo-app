package client

import (
	"context"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/client/v1"
	"github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/client/v1/pbconnect"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/auth"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
)

type ClientService struct {
	repository ClientRepositoryInterface
	logger     log.Logger
}

var _ pbconnect.ClientServiceHandler = new(ClientService)

func NewClientService(l log.Logger, repo ClientRepositoryInterface) *ClientService {
	return &ClientService{logger: l, repository: repo}
}

func (s *ClientService) CreateClientProfile(ctx context.Context, req *connect.Request[v1pb.CreateClientProfileRequest]) (*connect.Response[v1pb.CreateClientProfileResponse], error) {
	logger := log.FromContext(ctx)

	if err := auth.EnsureSameUser(ctx, req.Msg.GetUserId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	logger.Info(ctx, "handling CreateClientProfile request", "user_id", req.Msg.GetUserId())

	p := &models.ClientProfile{
		UserID:   req.Msg.GetUserId(),
		Location: req.Msg.GetLocation(),
	}

	if err := s.repository.CreateClientProfile(ctx, p); err != nil {
		logger.WithError(err).Error(ctx, "failed to create client profile", "user_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "client profile created successfully", "user_id", req.Msg.GetUserId())
	return connect.NewResponse(&v1pb.CreateClientProfileResponse{ClientProfile: &v1pb.ClientProfile{
		UserId:   p.UserID,
		Location: p.Location,
	}}), nil
}

func (s *ClientService) GetClientProfile(ctx context.Context, req *connect.Request[v1pb.GetClientProfileRequest]) (*connect.Response[v1pb.GetClientProfileResponse], error) {
	logger := log.FromContext(ctx)

	if err := auth.EnsureSameUser(ctx, req.Msg.GetUserId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	logger.Info(ctx, "handling GetClientProfile request", "user_id", req.Msg.GetUserId())

	p, err := s.repository.GetClientProfile(ctx, req.Msg.GetUserId())
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to get client profile", "user_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "client profile retrieved successfully", "user_id", req.Msg.GetUserId())
	return connect.NewResponse(&v1pb.GetClientProfileResponse{ClientProfile: &v1pb.ClientProfile{
		UserId:   p.UserID,
		Location: p.Location,
	}}), nil
}

func (s *ClientService) DeleteClientProfile(ctx context.Context, req *connect.Request[v1pb.DeleteClientProfileRequest]) (*connect.Response[v1pb.DeleteClientProfileResponse], error) {
	logger := log.FromContext(ctx)

	if err := auth.EnsureSameUser(ctx, req.Msg.GetUserId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	logger.Info(ctx, "handling DeleteClientProfile request", "user_id", req.Msg.GetUserId())

	if err := s.repository.DeleteClientProfile(ctx, req.Msg.GetUserId()); err != nil {
		logger.WithError(err).Error(ctx, "failed to delete client profile", "user_id", req.Msg.GetUserId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "client profile deleted successfully", "user_id", req.Msg.GetUserId())
	return connect.NewResponse(&v1pb.DeleteClientProfileResponse{}), nil
}
