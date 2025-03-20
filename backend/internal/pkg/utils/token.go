package utils

import (
	"time"

	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"

	v1pb "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
)

// IssueTokens generates an access token and a refresh token for a user.
// The access token expires in 15 minutes.
func IssueTokens(userID uuid.UUID, jwtSecret []byte) (*v1pb.AuthToken, error) {
	accessToken, err := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"user_id": userID.String(),
		"exp":     time.Now().Add(15 * time.Minute).Unix(),
	}).SignedString(jwtSecret)
	if err != nil {
		return nil, err
	}

	refreshToken := uuid.New().String()

	return &v1pb.AuthToken{
		AccessToken:  accessToken,
		RefreshToken: refreshToken,
		ExpiresAt:    time.Now().Add(15 * time.Minute).Format(time.RFC3339),
	}, nil
}
