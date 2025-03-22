package app

import (
	"context"
	"errors"
	"testing"

	"github.com/google/uuid"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"

	"connectrpc.com/connect"
	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log/slog"
)

type mockUserRepo struct {
	mock.Mock
}

func (m *mockUserRepo) CreateUser(ctx context.Context, user *models.User) error {
	args := m.Called(ctx, user)
	return args.Error(0)
}
func (m *mockUserRepo) GetUser(ctx context.Context, id uuid.UUID) (*models.User, error) {
	args := m.Called(ctx, id)
	return args.Get(0).(*models.User), args.Error(1)
}
func (m *mockUserRepo) UpdateUser(ctx context.Context, user *models.User) error {
	args := m.Called(ctx, user)
	return args.Error(0)
}
func (m *mockUserRepo) DeleteUser(ctx context.Context, id uuid.UUID) error {
	args := m.Called(ctx, id)
	return args.Error(0)
}

func TestCreateUser(t *testing.T) {
	tests := []struct {
		name      string
		setupMock func(repo *mockUserRepo)
		expectErr bool
	}{
		{
			name: "successful create",
			setupMock: func(repo *mockUserRepo) {
				repo.On("CreateUser", mock.Anything, mock.Anything).Return(nil)
			},
			expectErr: false,
		},
		{
			name: "repo error on create",
			setupMock: func(repo *mockUserRepo) {
				repo.On("CreateUser", mock.Anything, mock.Anything).Return(errors.New("db error"))
			},
			expectErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			repo := new(mockUserRepo)
			logger := slog.New()
			service := NewUserService(logger, repo)

			tt.setupMock(repo)

			resp, err := service.CreateUser(context.Background(), connect.NewRequest(&v1pb.CreateUserRequest{
				FirstName: "Jane",
				LastName:  "Doe",
			}))

			if tt.expectErr {
				assert.Error(t, err)
				assert.Nil(t, resp)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, "Jane", resp.Msg.User.FirstName)
			}
			repo.AssertExpectations(t)
		})
	}
}

func TestGetUser(t *testing.T) {
	tests := []struct {
		name      string
		setupMock func(repo *mockUserRepo, id uuid.UUID)
		expectErr bool
	}{
		{
			name: "successful get",
			setupMock: func(repo *mockUserRepo, id uuid.UUID) {
				repo.On("GetUser", mock.Anything, id).Return(&models.User{ID: id, FirstName: "Jane", LastName: "Doe"}, nil)
			},
			expectErr: false,
		},
		{
			name: "repo error on get",
			setupMock: func(repo *mockUserRepo, id uuid.UUID) {
				repo.On("GetUser", mock.Anything, id).Return((*models.User)(nil), errors.New("get error"))
			},
			expectErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			repo := new(mockUserRepo)
			logger := slog.New()
			service := NewUserService(logger, repo)
			id := uuid.New()

			tt.setupMock(repo, id)

			resp, err := service.GetUser(context.Background(), connect.NewRequest(&v1pb.GetUserRequest{
				Id: id.String(),
			}))

			if tt.expectErr {
				assert.Error(t, err)
				assert.Nil(t, resp)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, "Jane", resp.Msg.User.FirstName)
			}
			repo.AssertExpectations(t)
		})
	}
}

func TestUpdateUser(t *testing.T) {
	tests := []struct {
		name      string
		setupMock func(repo *mockUserRepo)
		expectErr bool
	}{
		{
			name: "successful update",
			setupMock: func(repo *mockUserRepo) {
				repo.On("UpdateUser", mock.Anything, mock.Anything).Return(nil)
			},
			expectErr: false,
		},
		{
			name: "repo error on update",
			setupMock: func(repo *mockUserRepo) {
				repo.On("UpdateUser", mock.Anything, mock.Anything).Return(errors.New("update error"))
			},
			expectErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			repo := new(mockUserRepo)
			logger := slog.New()
			service := NewUserService(logger, repo)
			id := uuid.New()

			tt.setupMock(repo)

			resp, err := service.UpdateUser(context.Background(), connect.NewRequest(&v1pb.UpdateUserRequest{
				Id:        id.String(),
				FirstName: "Jane",
				LastName:  "Doe",
			}))

			if tt.expectErr {
				assert.Error(t, err)
				assert.Nil(t, resp)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, "Jane", resp.Msg.User.FirstName)
			}
			repo.AssertExpectations(t)
		})
	}
}

func TestDeleteUser(t *testing.T) {
	tests := []struct {
		name      string
		setupMock func(repo *mockUserRepo, id uuid.UUID)
		expectErr bool
	}{
		{
			name: "successful delete",
			setupMock: func(repo *mockUserRepo, id uuid.UUID) {
				repo.On("DeleteUser", mock.Anything, id).Return(nil)
			},
			expectErr: false,
		},
		{
			name: "repo error on delete",
			setupMock: func(repo *mockUserRepo, id uuid.UUID) {
				repo.On("DeleteUser", mock.Anything, id).Return(errors.New("delete error"))
			},
			expectErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			repo := new(mockUserRepo)
			logger := slog.New()
			service := NewUserService(logger, repo)
			id := uuid.New()

			tt.setupMock(repo, id)

			resp, err := service.DeleteUser(context.Background(), connect.NewRequest(&v1pb.DeleteUserRequest{
				Id: id.String(),
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
