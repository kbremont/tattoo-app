package app

import (
	"context"
	"log"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
)

// UserService is the implementation of tattooapp.v1.UserService.
type UserService struct {
	repository UserRepository
}

// UserRepository is the interface that allows stateful operations on a users.
type UserRepository interface {
	CreateUser(ctx context.Context, u *v1pb.User) (*v1pb.User, error)
	GetUser(ctx context.Context, id int32) (*v1pb.User, error)
	UpdateUser(ctx context.Context, u *v1pb.User) (*v1pb.User, error)
	DeleteUser(ctx context.Context, id int32) error
}

var _ pbconnect.UserServiceHandler = new(UserService)

func NewUserService(ctx context.Context, repo UserRepository) *UserService {
	return &UserService{repository: repo}
}

// CreateUser implements tattooapp.v1.UserService.CreateUser.
func (s *UserService) CreateUser(ctx context.Context, req *connect.Request[v1pb.CreateUserRequest]) (*connect.Response[v1pb.CreateUserResponse], error) {
	log.Println("Creating user: ", req.Msg.FirstName)
	u, err := s.repository.CreateUser(ctx, &v1pb.User{
		Email:     req.Msg.Email,
		FirstName: req.Msg.FirstName,
		LastName:  req.Msg.LastName,
	})
	if err != nil {
		return nil, err
	}

	return connect.NewResponse(&v1pb.CreateUserResponse{UserId: u.UserId}), nil
}

// GetUser implements tattooapp.v1.UserService.GetUser.
func (s *UserService) GetUser(ctx context.Context, req *connect.Request[v1pb.GetUserRequest]) (*connect.Response[v1pb.GetUserResponse], error) {
	log.Println("Getting user: ", req.Msg.UserId)
	u, err := s.repository.GetUser(ctx, req.Msg.UserId)
	if err != nil {
		return nil, err
	}

	return connect.NewResponse(&v1pb.GetUserResponse{User: u}), nil
}

// UpdateUser implements tattooapp.v1.UserService.UpdateUser.
func (s *UserService) UpdateUser(ctx context.Context, req *connect.Request[v1pb.UpdateUserRequest]) (*connect.Response[v1pb.UpdateUserResponse], error) {
	log.Println("Updating user: ", req.Msg.UserId)
	u, err := s.repository.UpdateUser(ctx, &v1pb.User{
		UserId:    req.Msg.UserId,
		Email:     req.Msg.Email,
		FirstName: req.Msg.FirstName,
		LastName:  req.Msg.LastName,
	})
	if err != nil {
		return nil, err
	}

	return connect.NewResponse(&v1pb.UpdateUserResponse{User: u}), nil
}

// DeleteUser implements tattooapp.v1.UserService.DeleteUser.
func (s *UserService) DeleteUser(ctx context.Context, req *connect.Request[v1pb.DeleteUserRequest]) (*connect.Response[v1pb.DeleteUserResponse], error) {
	log.Println("Deleting user: ", req.Msg.UserId)
	if err := s.repository.DeleteUser(ctx, req.Msg.UserId); err != nil {
		return nil, err
	}

	return connect.NewResponse(&v1pb.DeleteUserResponse{}), nil
}
