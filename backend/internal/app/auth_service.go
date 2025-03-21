package app

import (
	"context"
	"fmt"
	"log"
	"time"

	"connectrpc.com/connect"
	"github.com/google/uuid"

	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1/pbconnect"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/utils"
)

// AuthService is the implementation of tattooapp.v1.AuthService.
type AuthService struct {
	repository  AuthRepository
	jwtSecret   string
	userService IUserServiceClient
}

// AuthRepository is the interface that allows stateful operations on auth_accounts.
type AuthRepository interface {
	CreateAuthAccount(ctx context.Context, acc *models.AuthAccount) error
	GetAuthAccountByEmail(ctx context.Context, email string) (*models.AuthAccount, error)
	SaveRefreshToken(ctx context.Context, userID uuid.UUID, token string, expiresAt time.Time) error
	GetRefreshToken(ctx context.Context, token string) (uuid.UUID, error)
	DeleteRefreshToken(ctx context.Context, token string) error
	DeleteAuthAccount(ctx context.Context, userID uuid.UUID) error
}

var _ pbconnect.AuthServiceHandler = new(AuthService)

func NewAuthService(repo AuthRepository, jwt string, us IUserServiceClient) *AuthService {
	return &AuthService{repository: repo, jwtSecret: jwt, userService: us}
}

// SignUp implements tattooapp.v1.AuthService.SignUp.
func (s *AuthService) SignUp(ctx context.Context, req *connect.Request[v1pb.SignUpRequest]) (*connect.Response[v1pb.SignUpResponse], error) {
	log.Println("SignUp called")

	email := req.Msg.GetCredentials().GetEmail()
	password := req.Msg.GetCredentials().GetPassword()
	firstName := req.Msg.GetFirstName()
	lastName := req.Msg.GetLastName()
	hashedPassword, err := utils.HashPassword(password)
	if err != nil {
		return nil, err
	}

	userID := uuid.New()

	account := &models.AuthAccount{
		UserID:       userID,
		Email:        email,
		PasswordHash: string(hashedPassword),
		IsVerified:   false,
	}

	err = s.repository.CreateAuthAccount(ctx, account)
	if err != nil {
		return nil, err
	}

	// retry loop for calling CreateUser
	maxRetries := 3
	for i := 0; i < maxRetries; i++ {
		err = s.userService.CreateUser(ctx, userID.String(), firstName, lastName)
		if err == nil {
			break
		}
		time.Sleep((1 + 1) * time.Second) // exponential backoff
	}

	if err != nil {
		// Manual rollback: delete auth account since user profile creation failed
		_ = s.repository.DeleteAuthAccount(ctx, userID)
		return nil, fmt.Errorf("failed to create user profile: %w", err)
	}

	tokenPair, err := utils.IssueTokens(userID, []byte(s.jwtSecret))
	if err != nil {
		return nil, err
	}

	resp := connect.NewResponse(&v1pb.SignUpResponse{
		User:  &v1pb.UserId{UserId: userID.String()},
		Token: tokenPair,
	})
	return resp, nil
}

// LogIn implements tattooapp.v1.AuthService.LogIn.
func (s *AuthService) LogIn(ctx context.Context, req *connect.Request[v1pb.LogInRequest]) (*connect.Response[v1pb.LogInResponse], error) {
	log.Println("LogIn called")

	email := req.Msg.GetCredentials().GetEmail()
	password := req.Msg.GetCredentials().GetPassword()

	account, err := s.repository.GetAuthAccountByEmail(ctx, email)
	if err != nil {
		return nil, err
	}

	if err := utils.ComparePassword(account.PasswordHash, password); err != nil {
		return nil, err
	}

	tokenPair, err := utils.IssueTokens(account.UserID, []byte(s.jwtSecret))
	if err != nil {
		return nil, err
	}

	resp := connect.NewResponse(&v1pb.LogInResponse{
		User:  &v1pb.UserId{UserId: account.UserID.String()},
		Token: tokenPair,
	})
	return resp, nil
}

// RefreshToken implements tattooapp.v1.AuthService.RefreshToken.
func (s *AuthService) RefreshToken(ctx context.Context, req *connect.Request[v1pb.RefreshTokenRequest]) (*connect.Response[v1pb.RefreshTokenResponse], error) {
	log.Println("RefreshToken called")

	refreshToken := req.Msg.GetRefreshToken()

	userID, err := s.repository.GetRefreshToken(ctx, refreshToken)
	if err != nil {
		return nil, err
	}

	tokenPair, err := utils.IssueTokens(userID, []byte(s.jwtSecret))
	if err != nil {
		return nil, err
	}

	resp := connect.NewResponse(&v1pb.RefreshTokenResponse{
		Token: tokenPair,
	})
	return resp, nil
}

// LogOut implements tattooapp.v1.AuthService.LogOut.
func (s *AuthService) LogOut(ctx context.Context, req *connect.Request[v1pb.LogOutRequest]) (*connect.Response[v1pb.LogOutResponse], error) {
	log.Println("LogOut called")

	refreshToken := req.Msg.GetRefreshToken()
	err := s.repository.DeleteRefreshToken(ctx, refreshToken)
	if err != nil {
		return nil, err
	}
	return connect.NewResponse(&v1pb.LogOutResponse{Success: true}), nil
}
