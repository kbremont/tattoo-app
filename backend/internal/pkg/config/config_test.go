package config

import (
	"context"
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestParseConfigDefaults(t *testing.T) {
	_ = os.Unsetenv("PORT_SERVICE")
	_ = os.Unsetenv("DATABASE_URI")
	_ = os.Unsetenv("JWT_SECRET")

	cfg, err := Parse(context.Background())
	assert.NoError(t, err)
	assert.Equal(t, 9000, cfg.ServicePort)
	assert.Equal(t, "postgres://postgres:password@localhost:5432/postgres", cfg.DatabaseURI)
}

func TestParseConfigOverrides(t *testing.T) {
	_ = os.Setenv("PORT_SERVICE", "8888")
	_ = os.Setenv("DATABASE_URI", "postgres://custom:custom@localhost:5432/customdb")
	_ = os.Setenv("JWT_SECRET", "my-secret")

	cfg, err := Parse(context.Background())
	assert.NoError(t, err)
	assert.Equal(t, 8888, cfg.ServicePort)
	assert.Equal(t, "postgres://custom:custom@localhost:5432/customdb", cfg.DatabaseURI)
	assert.Equal(t, "my-secret", cfg.JWTSecret)
}
