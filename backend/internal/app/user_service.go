package app

import (
	"context"

	"connectrpc.com/connect"
	"github.com/google/uuid"
	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
)

// UserService is the implementation of tattooapp.v1.UserService.
type UserService struct {
	repository UserRepository
	logger     log.Logger
}

// UserRepository is the interface that allows stateful operations on a users.
type UserRepository interface {
	CreateUser(ctx context.Context, u *models.User) error
	GetUser(ctx context.Context, id uuid.UUID) (*models.User, error)
	UpdateUser(ctx context.Context, u *models.User) error
	DeleteUser(ctx context.Context, id uuid.UUID) error
}

var _ pbconnect.UserServiceHandler = new(UserService)

func NewUserService(l log.Logger, repo UserRepository) *UserService {
	return &UserService{logger: l, repository: repo}
}

// CreateUser implements tattooapp.v1.UserService.CreateUser.
func (s *UserService) CreateUser(ctx context.Context, req *connect.Request[v1pb.CreateUserRequest]) (*connect.Response[v1pb.CreateUserResponse], error) {
	logger := log.FromContext(ctx)
	logger.Info(ctx, "handling CreateUser request", "first_name", req.Msg.GetFirstName(), "last_name", req.Msg.GetLastName())

	u := &models.User{
		ID:        uuid.New(),
		FirstName: req.Msg.GetFirstName(),
		LastName:  req.Msg.GetLastName(),
	}

	if err := s.repository.CreateUser(ctx, u); err != nil {
		logger.WithError(err).Error(ctx, "failed to create user", "first_name", req.Msg.GetFirstName(), "last_name", req.Msg.GetLastName())
		return nil, err
	}

	logger.Info(ctx, "user created successfully", "user_id", u.ID.String())
	return connect.NewResponse(&v1pb.CreateUserResponse{User: &v1pb.User{
		Id:        u.ID.String(),
		FirstName: u.FirstName,
		LastName:  u.LastName,
	}}), nil
}

// GetUser implements tattooapp.v1.UserService.GetUser.
func (s *UserService) GetUser(ctx context.Context, req *connect.Request[v1pb.GetUserRequest]) (*connect.Response[v1pb.GetUserResponse], error) {
	logger := log.FromContext(ctx)
	logger.Info(ctx, "handling GetUser request", "user_id", req.Msg.GetId())

	id, _ := uuid.Parse(req.Msg.GetId())
	u, err := s.repository.GetUser(ctx, id)
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to get user", "user_id", req.Msg.GetId())
		return nil, err
	}

	logger.Info(ctx, "user retrieved successfully", "user_id", u.ID.String())
	return connect.NewResponse(&v1pb.GetUserResponse{User: &v1pb.User{
		Id:        u.ID.String(),
		FirstName: u.FirstName,
		LastName:  u.LastName,
	}}), nil
}

// UpdateUser implements tattooapp.v1.UserService.UpdateUser.
func (s *UserService) UpdateUser(ctx context.Context, req *connect.Request[v1pb.UpdateUserRequest]) (*connect.Response[v1pb.UpdateUserResponse], error) {
	logger := log.FromContext(ctx)
	logger.Info(ctx, "handling UpdateUser request", "user_id", req.Msg.GetId())

	id, _ := uuid.Parse(req.Msg.GetId())
	u := &models.User{
		ID:        id,
		FirstName: req.Msg.GetFirstName(),
		LastName:  req.Msg.GetLastName(),
	}

	if err := s.repository.UpdateUser(ctx, u); err != nil {
		logger.WithError(err).Error(ctx, "failed to update user", "user_id", req.Msg.GetId())
		return nil, err
	}

	logger.Info(ctx, "user updated successfully", "user_id", u.ID.String())
	return connect.NewResponse(&v1pb.UpdateUserResponse{User: &v1pb.User{
		Id:        u.ID.String(),
		FirstName: u.FirstName,
		LastName:  u.LastName,
	}}), nil
}

// DeleteUser implements tattooapp.v1.UserService.DeleteUser.
func (s *UserService) DeleteUser(ctx context.Context, req *connect.Request[v1pb.DeleteUserRequest]) (*connect.Response[v1pb.DeleteUserResponse], error) {
	logger := log.FromContext(ctx)
	logger.Info(ctx, "handling DeleteUser request", "user_id", req.Msg.GetId())

	id, _ := uuid.Parse(req.Msg.GetId())
	if err := s.repository.DeleteUser(ctx, id); err != nil {
		logger.WithError(err).Error(ctx, "failed to delete user", "user_id", req.Msg.GetId())
		return nil, err
	}

	logger.Info(ctx, "user deleted successfully", "user_id", id.String())
	return connect.NewResponse(&v1pb.DeleteUserResponse{Success: true}), nil
}
