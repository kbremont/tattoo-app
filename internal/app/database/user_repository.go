package database

import (
	"context"
	"database/sql"

	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/internal/app"
)

type UserRepository struct{ db *sql.DB }

var _ app.UserRepository = new(UserRepository)

// NewUserRepository returns a *UserRepository configured to use db
func NewUserRepository(db *sql.DB) *UserRepository { return &UserRepository{db: db} }

func (r *UserRepository) CreateUser(ctx context.Context, u *v1pb.User) (*v1pb.User, error) {
	const exec = `INSERT INTO "users"
  (email, first_name, last_name)
  VALUES ($1, $2, $3)
  RETURNING id;`
	id := int32(0)

	err := r.db.QueryRowContext(ctx, exec, u.Email, u.FirstName, u.LastName).Scan(&id)
	if err != nil {
		return nil, err
	}

	u.UserId = id
	return u, nil
}

func (r *UserRepository) GetUser(ctx context.Context, id int32) (*v1pb.User, error) {
	const exec = `SELECT id, email, first_name, last_name
  FROM "users"
  WHERE id = $1;`

	var u v1pb.User
	err := r.db.QueryRowContext(ctx, exec, id).Scan(&u.UserId, &u.Email, &u.FirstName, &u.LastName)
	if err != nil {
		return nil, err
	}

	return &u, nil
}

func (r *UserRepository) UpdateUser(ctx context.Context, u *v1pb.User) (*v1pb.User, error) {
	const exec = `UPDATE "users"
  SET email = $1, first_name = $2, last_name = $3
  WHERE id = $4
  RETURNING id;`

	var id int32
	err := r.db.QueryRowContext(ctx, exec, u.Email, u.FirstName, u.LastName, u.UserId).Scan(&id)
	if err != nil {
		return nil, err
	}

	return u, nil
}

func (r *UserRepository) DeleteUser(ctx context.Context, id int32) error {
	const exec = `DELETE FROM "users" WHERE id = $1;`
	_, err := r.db.ExecContext(ctx, exec, id)
	return err
}
