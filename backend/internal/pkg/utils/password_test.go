package utils

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestHashAndComparePassword(t *testing.T) {
	password := "strong-password"

	hash, err := HashPassword(password)
	assert.NoError(t, err)
	assert.NotEmpty(t, hash)

	err = ComparePassword(hash, password)
	assert.NoError(t, err)

	err = ComparePassword(hash, "wrong-password")
	assert.Error(t, err)
}
