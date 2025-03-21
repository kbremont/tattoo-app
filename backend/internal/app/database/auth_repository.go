package database

import (
	"context"
	"database/sql"
	"time"

	"github.com/google/uuid"
	"github.com/kbremont/tattoo-app/backend/internal/app"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
)

type AuthRepository struct{ db *sql.DB }

var _ app.AuthRepository = new(AuthRepository)

// NewAuthRepository returns a *AuthRepository configured to use db
func NewAuthRepository(db *sql.DB) *AuthRepository { return &AuthRepository{db: db} }

func (r *AuthRepository) CreateAuthAccount(ctx context.Context, acc *models.AuthAccount) error {
	const exec = `INSERT INTO auth_accounts
  (user_id, email, password_hash, is_verified, created_at, updated_at)
  VALUES ($1, $2, $3, $4, NOW(), NOW());`

	_, err := r.db.ExecContext(ctx, exec, acc.UserID, acc.Email, acc.PasswordHash, acc.IsVerified)
	return err
}

func (r *AuthRepository) GetAuthAccountByEmail(ctx context.Context, email string) (*models.AuthAccount, error) {
	const exec = `SELECT user_id, email, password_hash, is_verified, created_at, updated_at
  FROM auth_accounts
  WHERE email = $1;`

	var acc models.AuthAccount
	err := r.db.QueryRowContext(ctx, exec, email).Scan(&acc.UserID, &acc.Email, &acc.PasswordHash, &acc.IsVerified, &acc.CreatedAt, &acc.UpdatedAt)
	if err != nil {
		return nil, err
	}
	return &acc, nil
}

func (r *AuthRepository) SaveRefreshToken(ctx context.Context, userID uuid.UUID, token string, expiresAt time.Time) error {
	const exec = `INSERT INTO refresh_tokens
  (user_id, token, expires_at, created_at)
  VALUES ($1, $2, $3, NOW());`

	_, err := r.db.ExecContext(ctx, exec, userID, token, expiresAt)
	return err
}

func (r *AuthRepository) GetRefreshToken(ctx context.Context, token string) (uuid.UUID, error) {
	const exec = `SELECT user_id
  FROM refresh_tokens
  WHERE token = $1 AND expires_at > NOW();`

	var userID uuid.UUID
	err := r.db.QueryRowContext(ctx, exec, token).Scan(&userID)
	return userID, err
}

func (r *AuthRepository) DeleteRefreshToken(ctx context.Context, token string) error {
	const exec = `DELETE FROM refresh_tokens
  WHERE token = $1;`
	_, err := r.db.ExecContext(ctx, exec, token)
	return err
}
