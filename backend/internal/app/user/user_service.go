package user

import (
	"context"
	"database/sql"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/user/v1"
	"github.com/kbremont/tattoo-app/backend/api/proto/gen/go/tattooapp/user/v1/pbconnect"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/auth"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
	"google.golang.org/protobuf/types/known/fieldmaskpb"
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
		Role:      mapProtoUserRoleToUserRole(req.Msg.GetRole()),
		FirstName: req.Msg.GetFirstName(),
		LastName:  req.Msg.GetLastName(),
	}

	if err := s.repository.CreateUser(ctx, u); err != nil {
		logger.WithError(err).Error(ctx, "failed to create user", "first_name", req.Msg.GetFirstName(), "last_name", req.Msg.GetLastName())
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "user created successfully", "id", req.Msg.GetId())
	return connect.NewResponse(&v1pb.CreateUserResponse{User: mapUserToProto(u)}), nil
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
	return connect.NewResponse(&v1pb.GetUserResponse{User: mapUserToProto(u)}), nil
}

// UpdateUser implements tattooapp.v1.UserService.UpdateUser.
func (s *UserService) UpdateUser(ctx context.Context, req *connect.Request[v1pb.UpdateUserRequest]) (*connect.Response[v1pb.UpdateUserResponse], error) {
	logger := log.FromContext(ctx)
	logger.Info(ctx, "handling UpdateUser request", "id", req.Msg.GetUser().Id)

	if err := auth.EnsureSameUser(ctx, req.Msg.GetUser().Id); err != nil {
		logger.Warn(ctx, "unauthorized access attempt", "target_id", req.Msg.GetUser().Id)
		return nil, connect.NewError(connect.CodePermissionDenied, err)
	}

	// get the existing user
	u, err := s.repository.GetUser(ctx, req.Msg.GetUser().Id)
	if err != nil {
		logger.WithError(err).Error(ctx, "failed to get user", "id", req.Msg.GetUser().Id)
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	// only update the fields that are set
	if shouldUpdate("first_name", req.Msg.GetUpdateMask()) {
		u.FirstName = req.Msg.GetUser().FirstName
	}
	if shouldUpdate("last_name", req.Msg.GetUpdateMask()) {
		u.LastName = req.Msg.GetUser().LastName
	}
	if shouldUpdate("avatar_url", req.Msg.GetUpdateMask()) {
		u.AvatarUrl = sql.NullString{String: req.Msg.GetUser().AvatarUrl, Valid: true}
	}

	if err := s.repository.UpdateUser(ctx, u); err != nil {
		logger.WithError(err).Error(ctx, "failed to update user", "id", req.Msg.GetUser().Id)
		return nil, connect.NewError(connect.CodeInternal, err)
	}

	logger.Info(ctx, "user updated successfully", "user_id", u.Id)
	return connect.NewResponse(&v1pb.UpdateUserResponse{User: mapUserToProto(u)}), nil
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

func shouldUpdate(field string, mask *fieldmaskpb.FieldMask) bool {
	for _, path := range mask.GetPaths() {
		if path == field {
			return true
		}
	}
	return false
}

func mapUserToProto(u *models.User) *v1pb.User {
	au := ""
	if u.AvatarUrl.Valid {
		au = u.AvatarUrl.String
	}

	return &v1pb.User{
		Id:        u.Id,
		Role:      mapUserRoleToProtoUserRole(u.Role),
		FirstName: u.FirstName,
		LastName:  u.LastName,
		AvatarUrl: au,
	}
}

func mapProtoToUser(u *v1pb.User) *models.User {
	au := sql.NullString{String: "", Valid: false}
	if u.AvatarUrl != "" {
		au = sql.NullString{String: u.AvatarUrl, Valid: true}
	}

	return &models.User{
		Id:        u.Id,
		Role:      mapProtoUserRoleToUserRole(u.GetRole()),
		FirstName: u.GetFirstName(),
		LastName:  u.GetLastName(),
		AvatarUrl: au,
	}
}

func mapProtoUserRoleToUserRole(role v1pb.UserRole) models.UserRole {
	switch role {
	case v1pb.UserRole_USER_ROLE_ARTIST:
		return models.UserRoleArtist
	case v1pb.UserRole_USER_ROLE_CLIENT:
		return models.UserRoleClient
	default:
		return models.UserRoleClient
	}
}

func mapUserRoleToProtoUserRole(role models.UserRole) v1pb.UserRole {
	switch role {
	case models.UserRoleArtist:
		return v1pb.UserRole_USER_ROLE_ARTIST
	case models.UserRoleClient:
		return v1pb.UserRole_USER_ROLE_CLIENT
	default:
		return v1pb.UserRole_USER_ROLE_CLIENT
	}
}
