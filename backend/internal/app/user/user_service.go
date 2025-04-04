package user

import (
	"context"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/user/v1"
	"github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/user/v1/pbconnect"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/auth"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
)

// UserService is the implementation of tattooapp.v1.UserService.
type UserService struct {
	repository UserRepositoryInterface
	logger     log.Logger
}

var _ pbconnect.UserServiceHandler = new(UserService)

func NewUserService(l log.Logger, repo UserRepositoryInterface) *UserService {
	return &UserService{logger: l, repository: repo}
}

// CreateUser implements tattooapp.v1.UserService.CreateUser.
func (s *UserService) CreateUser(ctx context.Context, req *connect.Request[v1pb.CreateUserRequest]) (*connect.Response[v1pb.CreateUserResponse], error) {
	logger := log.FromContext(ctx)

	if err := auth.EnsureSameUser(ctx, req.Msg.GetId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	logger.Info(ctx, "handling CreateUser request", "id", req.Msg.GetId())

	u := &models.User{
		Id:        req.Msg.GetId(),
		Role:      mapPbUserRoleToModelUserRole(req.Msg.GetRole()),
		FirstName: req.Msg.GetFirstName(),
		LastName:  req.Msg.GetLastName(),
	}

	if err := s.repository.CreateUser(ctx, u); err != nil {
		logger.WithError(err).Error(ctx, "failed to create user", "first_name", req.Msg.GetFirstName(), "last_name", req.Msg.GetLastName())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "user created successfully", "id", req.Msg.GetId())
	return connect.NewResponse(&v1pb.CreateUserResponse{User: &v1pb.User{
		Id:        u.Id,
		Role:      mapModelUserRoleToPbUserRole(u.Role),
		FirstName: u.FirstName,
		LastName:  u.LastName,
	}}), nil
}

// GetUser implements tattooapp.v1.UserService.GetUser.
func (s *UserService) GetUser(ctx context.Context, req *connect.Request[v1pb.GetUserRequest]) (*connect.Response[v1pb.GetUserResponse], error) {
	logger := log.FromContext(ctx)
	logger.Info(ctx, "handling GetUser request", "id", req.Msg.GetId())

	if err := auth.EnsureSameUser(ctx, req.Msg.GetId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	u, err := s.repository.GetUser(ctx, req.Msg.GetId())
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to get user", "id", req.Msg.GetId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "user retrieved successfully", "user_id", u.Id)
	return connect.NewResponse(&v1pb.GetUserResponse{User: &v1pb.User{
		Id:        u.Id,
		Role:      mapModelUserRoleToPbUserRole(u.Role),
		FirstName: u.FirstName,
		LastName:  u.LastName,
	}}), nil
}

// UpdateUser implements tattooapp.v1.UserService.UpdateUser.
func (s *UserService) UpdateUser(ctx context.Context, req *connect.Request[v1pb.UpdateUserRequest]) (*connect.Response[v1pb.UpdateUserResponse], error) {
	logger := log.FromContext(ctx)
	logger.Info(ctx, "handling UpdateUser request", "id", req.Msg.GetId())

	if err := auth.EnsureSameUser(ctx, req.Msg.GetId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	u := &models.User{
		Id:        req.Msg.GetId(),
		FirstName: req.Msg.GetFirstName(),
		LastName:  req.Msg.GetLastName(),
	}

	if err := s.repository.UpdateUser(ctx, u); err != nil {
		logger.WithError(err).Error(ctx, "failed to update user", "id", req.Msg.GetId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "user updated successfully", "user_id", u.Id)
	return connect.NewResponse(&v1pb.UpdateUserResponse{User: &v1pb.User{
		Id:        u.Id,
		FirstName: u.FirstName,
		LastName:  u.LastName,
	}}), nil
}

// DeleteUser implements tattooapp.v1.UserService.DeleteUser.
func (s *UserService) DeleteUser(ctx context.Context, req *connect.Request[v1pb.DeleteUserRequest]) (*connect.Response[v1pb.DeleteUserResponse], error) {
	logger := log.FromContext(ctx)
	logger.Info(ctx, "handling DeleteUser request", "id", req.Msg.GetId())

	if err := auth.EnsureSameUser(ctx, req.Msg.GetId()); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetId())
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	if err := s.repository.DeleteUser(ctx, req.Msg.GetId()); err != nil {
		logger.WithError(err).Error(ctx, "failed to delete user", "id", req.Msg.GetId())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "user deleted successfully", "id", req.Msg.GetId())
	return connect.NewResponse(&v1pb.DeleteUserResponse{Success: true}), nil
}

func mapPbUserRoleToModelUserRole(role v1pb.UserRole) models.UserRole {
	switch role {
	case v1pb.UserRole_USER_ROLE_ARTIST:
		return models.UserRoleArtist
	case v1pb.UserRole_USER_ROLE_CLIENT:
		return models.UserRoleClient
	default:
		return models.UserRoleClient
	}
}

func mapModelUserRoleToPbUserRole(role models.UserRole) v1pb.UserRole {
	switch role {
	case models.UserRoleArtist:
		return v1pb.UserRole_USER_ROLE_ARTIST
	case models.UserRoleClient:
		return v1pb.UserRole_USER_ROLE_CLIENT
	default:
		return v1pb.UserRole_USER_ROLE_CLIENT
	}
}
