package app

import (
	"context"
	"log"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
)

// UserService is the implementation of tattooapp.v1.UserService.
type UserService struct{}

var _ pbconnect.UserServiceHandler = new(UserService)
var count = 0
var users = make(map[int]*v1pb.User)

func NewUserService(ctx context.Context) (*UserService, error) {
	return &UserService{}, nil
}

// CreateUser implements tattooapp.v1.UserService.CreateUser.
func (s *UserService) CreateUser(ctx context.Context, req *connect.Request[v1pb.CreateUserRequest]) (*connect.Response[v1pb.CreateUserResponse], error) {
	log.Println("Creating user: ", req.Msg.FirstName)
	users[count] = &v1pb.User{
		UserId:    int32(count),
		Email:     req.Msg.Email,
		FirstName: req.Msg.FirstName,
		LastName:  req.Msg.LastName,
	}
	count++

	return connect.NewResponse(&v1pb.CreateUserResponse{}), nil
}

// GetUser implements tattooapp.v1.UserService.GetUser.
func (s *UserService) GetUser(ctx context.Context, req *connect.Request[v1pb.GetUserRequest]) (*connect.Response[v1pb.GetUserResponse], error) {
	return connect.NewResponse(&v1pb.GetUserResponse{User: users[int(req.Msg.UserId)]}), nil
}

// UpdateUser implements tattooapp.v1.UserService.UpdateUser.
func (s *UserService) UpdateUser(ctx context.Context, req *connect.Request[v1pb.UpdateUserRequest]) (*connect.Response[v1pb.UpdateUserResponse], error) {
	users[int(req.Msg.UserId)] = &v1pb.User{
		UserId:    req.Msg.UserId,
		Email:     req.Msg.Email,
		FirstName: req.Msg.FirstName,
		LastName:  req.Msg.LastName,
	}
	return connect.NewResponse(&v1pb.UpdateUserResponse{User: users[int(req.Msg.UserId)]}), nil
}

// DeleteUser implements tattooapp.v1.UserService.DeleteUser.
func (s *UserService) DeleteUser(ctx context.Context, req *connect.Request[v1pb.DeleteUserRequest]) (*connect.Response[v1pb.DeleteUserResponse], error) {
	delete(users, int(req.Msg.UserId))
	return connect.NewResponse(&v1pb.DeleteUserResponse{UserId: req.Msg.UserId}), nil
}
