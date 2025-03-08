package database

import (
	"database/sql"

	_ "github.com/lib/pq"
)

// New returns a connected *sql.DB
func New(dsn string, opts ...Option) (*sql.DB, error) {
	db, err := sql.Open("postgres", dsn)
	if err != nil {
		return nil, err
	}

	for _, opt := range opts {
		if err := opt(db); err != nil {
			return nil, err
		}
	}

	return db, nil
}
