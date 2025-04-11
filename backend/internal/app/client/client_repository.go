package client

import (
	"context"
	"database/sql"

	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
)

type ClientRepositoryInterface interface {
	CreateClientProfile(ctx context.Context, p *models.ClientProfile) error
	GetClientProfile(ctx context.Context, id string) (*models.ClientProfile, error)
	DeleteClientProfile(ctx context.Context, id string) error
}

type ClientRepository struct{ db *sql.DB }

var _ ClientRepositoryInterface = new(ClientRepository)

func NewClientRepository(db *sql.DB) *ClientRepository { return &ClientRepository{db: db} }

func (r *ClientRepository) CreateClientProfile(ctx context.Context, p *models.ClientProfile) error {
	const exec = `INSERT INTO "client_profiles"
	(user_id, location, created_at, updated_at)
	VALUES ($1, $2, NOW(), NOW());`

	_, err := r.db.ExecContext(ctx, exec, p.UserID, p.Location)
	return err
}

func (r *ClientRepository) GetClientProfile(ctx context.Context, id string) (*models.ClientProfile, error) {
	const exec = `SELECT user_id, location, created_at, updated_at
	FROM "client_profiles"
	WHERE user_id = $1;`

	var p models.ClientProfile
	err := r.db.QueryRowContext(ctx, exec, id).Scan(&p.UserID, &p.Location, &p.CreatedAt, &p.UpdatedAt)
	if err != nil {
		return nil, err
	}

	return &p, nil
}

func (r *ClientRepository) DeleteClientProfile(ctx context.Context, id string) error {
	const exec = `DELETE FROM "client_profiles" WHERE user_id = $1;`
	_, err := r.db.ExecContext(ctx, exec, id)
	return err
}
