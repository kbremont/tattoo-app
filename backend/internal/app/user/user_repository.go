package user

import (
	"context"
	"database/sql"

	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
	"github.com/lib/pq"
)

// UserRepository is the interface that allows stateful operations on a users.
type UserRepositoryInterface interface {
	CreateUser(ctx context.Context, u *models.User) error
	GetUser(ctx context.Context, id string) (*models.User, error)
	UpdateUser(ctx context.Context, u *models.User) error
	DeleteUser(ctx context.Context, id string) error
}

type UserRepository struct{ db *sql.DB }

var _ UserRepositoryInterface = new(UserRepository)

// NewUserRepository returns a *UserRepository configured to use db
func NewUserRepository(db *sql.DB) *UserRepository { return &UserRepository{db: db} }

func (r *UserRepository) CreateUser(ctx context.Context, u *models.User) error {
	const exec = `INSERT INTO "users"
  (id, role, first_name, last_name, style_preferences, created_at, updated_at)
  VALUES ($1, $2, $3, $4, $5, NOW(), NOW());`

	_, err := r.db.ExecContext(ctx, exec, u.Id, u.Role, u.FirstName, u.LastName, pq.Array(u.StylePreferences))
	return err
}

func (r *UserRepository) GetUser(ctx context.Context, id string) (*models.User, error) {
	var stylePrefs []string
	const exec = `SELECT id, role, first_name, last_name, style_preferences, avatar_url, created_at, updated_at
  FROM "users"
  WHERE id = $1;`

	var u models.User
	err := r.db.QueryRowContext(ctx, exec, id).Scan(&u.Id, &u.Role, &u.FirstName, &u.LastName, pq.Array(&stylePrefs), &u.AvatarUrl, &u.CreatedAt, &u.UpdatedAt)
	if err != nil {
		return nil, err
	}

	u.StylePreferences = make([]models.TattooStyle, len(stylePrefs))
	for i, s := range stylePrefs {
		u.StylePreferences[i] = models.TattooStyle(s)
	}

	return &u, nil
}

func (r *UserRepository) UpdateUser(ctx context.Context, u *models.User) error {
	stylePrefs := make([]string, len(u.StylePreferences))
	for i, s := range u.StylePreferences {
		stylePrefs[i] = string(s)
	}
	const exec = `UPDATE "users"
  SET first_name = $1, last_name = $2, style_preferences = $3, avatar_url = $4, updated_at = NOW()
  WHERE id = $5;`

	_, err := r.db.ExecContext(ctx, exec, u.FirstName, u.LastName, pq.Array(stylePrefs), u.AvatarUrl, u.Id)
	return err
}

func (r *UserRepository) DeleteUser(ctx context.Context, id string) error {
	const exec = `DELETE FROM "users" WHERE id = $1;`
	_, err := r.db.ExecContext(ctx, exec, id)
	return err
}
