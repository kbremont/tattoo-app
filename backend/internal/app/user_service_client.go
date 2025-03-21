package app

import (
	"context"
	"net/http"
	"os"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
)

type UserServiceClient struct {
	client pbconnect.UserServiceClient
}

func NewUserServiceClient() *UserServiceClient {
	userServiceURL := os.Getenv("USER_SERVICE_URL")
	if userServiceURL == "" {
		userServiceURL = "http://localhost:9001"
	}
	httpClient := &http.Client{}
	client := pbconnect.NewUserServiceClient(
		httpClient,
		userServiceURL,
	)
	return &UserServiceClient{client: client}
}

func (u *UserServiceClient) CreateUser(ctx context.Context, userID string, firstName string, lastName string) error {
	req := &v1pb.CreateUserRequest{
		Id:        userID,
		FirstName: firstName,
		LastName:  lastName,
	}
	_, err := u.client.CreateUser(ctx, connect.NewRequest(req))
	return err
}
