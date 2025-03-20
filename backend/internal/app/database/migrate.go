package database

import (
	"context"
	"database/sql"
	"io/fs"
	"log"

	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/postgres"
	"github.com/golang-migrate/migrate/v4/source/iofs"
)

// Migrate applies migration files at the specified path in the fs to db.
func Migrate(ctx context.Context, db *sql.DB, filesys fs.FS, path string, migrateDown bool) error {
	sourceDriver, err := iofs.New(filesys, path)
	if err != nil {
		return err
	}

	dbDriver, err := postgres.WithInstance(db, &postgres.Config{})
	if err != nil {
		return err
	}

	m, err := migrate.NewWithInstance("src", sourceDriver, "db", dbDriver)
	if err != nil {
		return err
	}

	// apply migrations
	if migrateDown {
		log.Println("migrating down")
		err = m.Down()
	} else {
		log.Println("migrating up")
		err = m.Up()
	}

	// handle errors
	if err != nil && err != migrate.ErrNoChange {
		return err
	} else if err == migrate.ErrNoChange {
		// no changes to apply
		log.Println("no changes to apply")
	} else {
		// migrations successfully applied
		log.Println("applied migrations")
	}

	return nil
}
