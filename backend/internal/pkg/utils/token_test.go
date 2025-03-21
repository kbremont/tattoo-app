package utils

import (
	"testing"

	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"github.com/stretchr/testify/assert"
)

func TestIssueTokens(t *testing.T) {
	userID := uuid.New()
	jwtSecret := []byte("test-secret")

	tokens, err := IssueTokens(userID, jwtSecret)
	assert.NoError(t, err)
	assert.NotEmpty(t, tokens.AccessToken)
	assert.NotEmpty(t, tokens.RefreshToken)

	// Parse JWT token to validate claims
	token, err := jwt.Parse(tokens.AccessToken, func(token *jwt.Token) (interface{}, error) {
		return jwtSecret, nil
	})
	assert.NoError(t, err)
	claims, ok := token.Claims.(jwt.MapClaims)
	assert.True(t, ok)
	assert.Equal(t, userID.String(), claims["user_id"])
}
