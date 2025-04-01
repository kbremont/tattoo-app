package config

import (
	"context"

	"github.com/caarlos0/env/v6"
)

// Config stores the configuration options available for the BookInfo application.
type Config struct {
	// ServerErrorLogging controls whether the server will log errors to stdout.
	ServerErrorLogging bool `env:"SERVER_ERROR_LOGGING" envDefault:"true"`
	// ServerStats controls whether the server will record statistics for requests.
	ServerStats bool `env:"SERVER_STATS" envDefault:"true"`
	// MigrateMode controls whether the binary will operate as a database migration
	// command or as a server. This control is in place to facilitate applying any
	// database schema changes required before the server is run.
	MigrateMode bool `env:"MIGRATE_MODE" envDefault:"false"`
	// MigrateDown controls whether the binary will apply the down migration instead
	// of the up migration. This control is in place to facilitate rolling back database
	// schema changes.
	MigrateDown bool `env:"MIGRATE_DOWN" envDefault:"false"`
	// Port controls which port exposes the server.
	Port int `env:"PORT" envDefault:"9000"`
	// DatabaseURI is the Postgres URI for the database.
	DatabaseURI string `env:"DATABASE_URI" envDefault:"postgres://postgres:password@localhost:5432/postgres"`
	// JWTSecret is the secret key used to sign JWT tokens.
	JWTSecret string `env:"JWT_SECRET" envDefault:"supersecretkey"`
	// Auth0Domain is the domain of the Auth0 service.
	Auth0Domain string `env:"AUTH0_DOMAIN" envDefault:"dev-pqjo5e7nvurmgv1u.us.auth0.com"`
}

// Parse attempts to read configuration settings from the environment into a
// Config object. If a setting cannot be read from the environment, a default
// value will be used as specified in the struct tags for Config.
func Parse(ctx context.Context) (*Config, error) {
	cfg := &Config{}
	if err := env.Parse(cfg); err != nil {
		return nil, err
	}

	return cfg, nil
}
