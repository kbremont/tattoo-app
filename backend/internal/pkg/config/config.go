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
	// StopIstioOnExit controls whether the binary will POST a quit message to the
	// Istio sidecar on successful process exit.  This facilitats the use of the binary in
	// k8s Jobs running with MigrateMode=true such that the Job will complete exit.
	StopIstioOnExit bool `env:"STOP_ISTIO_ON_EXIT" envDefault:"false"`
	// GatewayPort controls which port exposes the REST gateway server.
	GatewayPort int `env:"PORT_GATEAWAY" envDefault:"8000"`
	// ServicePort controls which port exposes the gRPC server.
	ServicePort int `env:"PORT_SERVICE" envDefault:"9000"`
	// DatabaseURI is the Postgres URI for the database.
	DatabaseURI string `env:"DATABASE_URI" envDefault:"postgres://postgres:password@localhost:5432/postgres"`
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
