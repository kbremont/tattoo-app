package database

import (
	"context"
	"database/sql"

	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	"github.com/kbremont/tattoo-app/backend/internal/app"
)

type ArtistRepository struct{ db *sql.DB }

var _ app.ArtistRepository = new(ArtistRepository)

func NewArtistRepository(db *sql.DB) *ArtistRepository { return &ArtistRepository{db: db} }

func (r *ArtistRepository) CreateArtist(ctx context.Context, a *v1pb.Artist) (*v1pb.Artist, error) {
	// panic("not implemented")
	const exec = `INSERT INTO "artists"
	  (user_id, style)
	  VALUES ($1, $2)
	  RETURNING id;`
	id := int32(0)

	err := r.db.QueryRowContext(ctx, exec, a.User.UserId, a.Style).Scan(&id)
	if err != nil {
		return nil, err
	}

	a.ArtistId = id
	return a, nil
}
