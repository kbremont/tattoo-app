package app

import (
	"context"
	"errors"
	"testing"
	"time"

	"github.com/google/uuid"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/utils"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
)

type mockAuthRepo struct {
	mock.Mock
}

func (m *mockAuthRepo) CreateAuthAccount(ctx context.Context, account *models.AuthAccount) error {
	args := m.Called(ctx, account)
	return args.Error(0)
}
func (m *mockAuthRepo) GetAuthAccountByEmail(ctx context.Context, email string) (*models.AuthAccount, error) {
	args := m.Called(ctx, email)
	return args.Get(0).(*models.AuthAccount), args.Error(1)
}
func (m *mockAuthRepo) SaveRefreshToken(ctx context.Context, userID uuid.UUID, token string, expiresAt time.Time) error {
	args := m.Called(ctx, userID, token, expiresAt)
	return args.Error(0)
}
func (m *mockAuthRepo) DeleteRefreshToken(ctx context.Context, token string) error {
	args := m.Called(ctx, token)
	return args.Error(0)
}
func (m *mockAuthRepo) GetRefreshToken(ctx context.Context, token string) (uuid.UUID, error) {
	args := m.Called(ctx, token)
	return args.Get(0).(uuid.UUID), args.Error(1)
}
func (m *mockAuthRepo) DeleteAuthAccount(ctx context.Context, userID uuid.UUID) error {
	args := m.Called(ctx, userID)
	return args.Error(0)
}

type mockUserServiceClient struct {
	mock.Mock
}

func (m *mockUserServiceClient) CreateUser(ctx context.Context, userID string, firstName string, lastName string) error {
	args := m.Called(ctx, userID, firstName, lastName)
	return args.Error(0)
}

func TestSignUp(t *testing.T) {
	tests := []struct {
		name      string
		setupMock func(repo *mockAuthRepo, userClient *mockUserServiceClient)
		expectErr bool
	}{
		{
			name: "successful signup",
			setupMock: func(repo *mockAuthRepo, userClient *mockUserServiceClient) {
				repo.On("CreateAuthAccount", mock.Anything, mock.Anything).Return(nil)
				userClient.On("CreateUser", mock.Anything, mock.Anything, mock.Anything, mock.Anything).Return(nil)
			},
			expectErr: false,
		},
		{
			name: "repository error",
			setupMock: func(repo *mockAuthRepo, userClient *mockUserServiceClient) {
				repo.On("CreateAuthAccount", mock.Anything, mock.Anything).Return(errors.New("db error"))
			},
			expectErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			repo := new(mockAuthRepo)
			userClient := new(mockUserServiceClient)
			jwtSecret := "test-secret"
			service := NewAuthService(repo, jwtSecret, userClient)

			tt.setupMock(repo, userClient)

			resp, err := service.SignUp(context.Background(), connect.NewRequest(&v1pb.SignUpRequest{
				Credentials: &v1pb.UserCredentials{
					Email:    "signup@example.com",
					Password: "password",
				},
			}))

			if tt.expectErr {
				assert.Error(t, err)
				assert.Nil(t, resp)
			} else {
				assert.NoError(t, err)
				assert.NotEmpty(t, resp.Msg.Token.AccessToken)
			}
			repo.AssertExpectations(t)
		})
	}
}

func TestLogIn(t *testing.T) {
	tests := []struct {
		name       string
		mockEmail  string
		mockPass   string
		setupMock  func(repo *mockAuthRepo, userClient *mockUserServiceClient, hash string, userID uuid.UUID)
		expectErr  bool
		expectUser bool
	}{
		{
			name:      "valid login",
			mockEmail: "test@example.com",
			mockPass:  "password",
			setupMock: func(repo *mockAuthRepo, userClient *mockUserServiceClient, hash string, userID uuid.UUID) {
				repo.On("GetAuthAccountByEmail", mock.Anything, "test@example.com").Return(&models.AuthAccount{
					UserID:       userID,
					Email:        "test@example.com",
					PasswordHash: hash,
				}, nil)
			},
			expectErr:  false,
			expectUser: true,
		},
		{
			name:      "invalid password",
			mockEmail: "test@example.com",
			mockPass:  "wrong-password",
			setupMock: func(repo *mockAuthRepo, userClient *mockUserServiceClient, hash string, userID uuid.UUID) {
				repo.On("GetAuthAccountByEmail", mock.Anything, "test@example.com").Return(&models.AuthAccount{
					UserID:       userID,
					Email:        "test@example.com",
					PasswordHash: hash,
				}, nil)
			},
			expectErr:  true,
			expectUser: false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			repo := new(mockAuthRepo)
			userClient := new(mockUserServiceClient)
			jwtSecret := "test-secret"
			service := NewAuthService(repo, jwtSecret, userClient)
			userID := uuid.New()
			hash, _ := utils.HashPassword("password")

			tt.setupMock(repo, userClient, hash, userID)

			resp, err := service.LogIn(context.Background(), connect.NewRequest(&v1pb.LogInRequest{
				Credentials: &v1pb.UserCredentials{
					Email:    tt.mockEmail,
					Password: tt.mockPass,
				},
			}))

			if tt.expectErr {
				assert.Error(t, err)
				assert.Nil(t, resp)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, userID.String(), resp.Msg.User.UserId)
			}
			repo.AssertExpectations(t)
		})
	}
}

func TestRefreshToken(t *testing.T) {
	tests := []struct {
		name      string
		setupMock func(repo *mockAuthRepo, userClient *mockUserServiceClient, userID uuid.UUID)
		expectErr bool
	}{
		{
			name: "valid refresh",
			setupMock: func(repo *mockAuthRepo, userClient *mockUserServiceClient, userID uuid.UUID) {
				repo.On("GetRefreshToken", mock.Anything, "refresh-token").Return(userID, nil)
			},
			expectErr: false,
		},
		{
			name: "refresh token not found",
			setupMock: func(repo *mockAuthRepo, userClient *mockUserServiceClient, userID uuid.UUID) {
				repo.On("GetRefreshToken", mock.Anything, "refresh-token").Return(uuid.Nil, errors.New("not found"))
			},
			expectErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			repo := new(mockAuthRepo)
			userClient := new(mockUserServiceClient)
			jwtSecret := "test-secret"
			service := NewAuthService(repo, jwtSecret, userClient)
			userID := uuid.New()

			tt.setupMock(repo, userClient, userID)

			resp, err := service.RefreshToken(context.Background(), connect.NewRequest(&v1pb.RefreshTokenRequest{
				RefreshToken: "refresh-token",
			}))

			if tt.expectErr {
				assert.Error(t, err)
				assert.Nil(t, resp)
			} else {
				assert.NoError(t, err)
				assert.NotEmpty(t, resp.Msg.Token.AccessToken)
			}
			repo.AssertExpectations(t)
		})
	}
}

func TestLogOut(t *testing.T) {
	tests := []struct {
		name      string
		setupMock func(repo *mockAuthRepo, userClient *mockUserServiceClient)
		expectErr bool
	}{
		{
			name: "successful logout",
			setupMock: func(repo *mockAuthRepo, userClient *mockUserServiceClient) {
				repo.On("DeleteRefreshToken", mock.Anything, "refresh-token").Return(nil)
			},
			expectErr: false,
		},
		{
			name: "logout repo failure",
			setupMock: func(repo *mockAuthRepo, userClient *mockUserServiceClient) {
				repo.On("DeleteRefreshToken", mock.Anything, "refresh-token").Return(errors.New("db error"))
			},
			expectErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			repo := new(mockAuthRepo)
			userClient := new(mockUserServiceClient)
			jwtSecret := "test-secret"
			service := NewAuthService(repo, jwtSecret, userClient)

			tt.setupMock(repo, userClient)

			resp, err := service.LogOut(context.Background(), connect.NewRequest(&v1pb.LogOutRequest{
				RefreshToken: "refresh-token",
			}))

			if tt.expectErr {
				assert.Error(t, err)
				assert.Nil(t, resp)
			} else {
				assert.NoError(t, err)
				assert.True(t, resp.Msg.Success)
			}
			repo.AssertExpectations(t)
		})
	}
}
