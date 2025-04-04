package artist

import (
	"context"
	"database/sql"

	"github.com/kbremont/tattoo-app/backend/internal/pkg/models"
)

type ArtistRepositoryInterface interface {
	CreateArtistProfile(ctx context.Context, p *models.ArtistProfile) error
	GetArtistProfile(ctx context.Context, id string) (*models.ArtistProfile, error)
	DeleteArtistProfile(ctx context.Context, id string) error
}

type ArtistRepository struct{ db *sql.DB }

var _ ArtistRepositoryInterface = new(ArtistRepository)

// NewArtistRepository returns a *ArtistRepository configured to use db
func NewArtistRepository(db *sql.DB) *ArtistRepository { return &ArtistRepository{db: db} }

func (r *ArtistRepository) CreateArtistProfile(ctx context.Context, p *models.ArtistProfile) error {
	const exec = `INSERT INTO "artist_profiles"
	(user_id, bio, location, tattoo_shop, created_at, updated_at)
	VALUES ($1, $2, $3, $4, NOW(), NOW());`

	_, err := r.db.ExecContext(ctx, exec, p.UserID, p.Bio, p.Location, p.TattooShop)
	return err
}

func (r *ArtistRepository) GetArtistProfile(ctx context.Context, id string) (*models.ArtistProfile, error) {
	const exec = `SELECT user_id, bio, location, tattoo_shop, created_at, updated_at
	FROM "artist_profiles"
	WHERE user_id = $1;`

	var p models.ArtistProfile
	err := r.db.QueryRowContext(ctx, exec, id).Scan(&p.UserID, &p.Bio, &p.Location, &p.TattooShop, &p.CreatedAt, &p.UpdatedAt)
	if err != nil {
		return nil, err
	}

	return &p, nil
}

func (r *ArtistRepository) DeleteArtistProfile(ctx context.Context, id string) error {
	const exec = `DELETE FROM "artist_profiles" WHERE user_id = $1;`
	_, err := r.db.ExecContext(ctx, exec, id)
	return err
}
