package database

import (
	"database/sql"
	"errors"
	"time"
)

const (
	// DefaultMaxPings is the default number of times to attempt pinging the database.
	DefaultMaxPings = 30
	// DefaultPingInterval is the default interval between ping attempts.
	DefaultPingInterval = 2 * time.Second
)

// Option is an option that can be provided when creating a *sql.DB
type Option func(*sql.DB) error

// WithPingTimeout returns an Option that will attempt to ping the database
// maxPings times with an interval between each attempt. If the database is
// not reachable after maxPings attempts, an error will be returned.
func WithPingTimeout(maxPings int, interval time.Duration) Option {
	return func(db *sql.DB) error {
		n := 0
		for n < maxPings {
			if err := db.Ping(); err == nil {
				return nil
			}
			time.Sleep(interval)
			n++
		}
		return errors.New("failed to ping database")
	}
}
