package database

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
	"github.com/kbremont/tattoo-app/backend/internal/app"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
)

type UserRepository struct{ db *sql.DB }

var _ app.UserRepository = new(UserRepository)

// NewUserRepository returns a *UserRepository configured to use db
func NewUserRepository(db *sql.DB) *UserRepository { return &UserRepository{db: db} }

func (r *UserRepository) CreateUser(ctx context.Context, u *models.User) error {
	const exec = `INSERT INTO "users"
  (id, first_name, last_name, created_at, updated_at)
  VALUES ($1, $2, $3, NOW(), NOW());`

	_, err := r.db.ExecContext(ctx, exec, u.ID, u.FirstName, u.LastName)
	return err
}

func (r *UserRepository) GetUser(ctx context.Context, id uuid.UUID) (*models.User, error) {
	const exec = `SELECT id, first_name, last_name, created_at, updated_at
  FROM "users"
  WHERE id = $1;`

	var u models.User
	err := r.db.QueryRowContext(ctx, exec, id).Scan(&u.ID, &u.FirstName, &u.LastName)
	if err != nil {
		return nil, err
	}

	return &u, nil
}

func (r *UserRepository) UpdateUser(ctx context.Context, u *models.User) error {
	const exec = `UPDATE "users"
  SET first_name = $1, last_name = $2, updated_at = NOW()
  WHERE id = $3;`

	_, err := r.db.ExecContext(ctx, exec, u.FirstName, u.LastName, u.ID)
	return err
}

func (r *UserRepository) DeleteUser(ctx context.Context, id uuid.UUID) error {
	const exec = `DELETE FROM "users" WHERE id = $1;`
	_, err := r.db.ExecContext(ctx, exec, id)
	return err
}
