package auth

import (
	"context"
	"errors"
)

const Auth0UserIDKey = "auth0_user_id"

var ErrMissingAuth0UserID = errors.New("auth0_user_id not found in context")

func GetAuth0UserID(ctx context.Context) (string, error) {
	val, ok := ctx.Value(Auth0UserIDKey).(string)
	if !ok || val == "" {
		return "", ErrMissingAuth0UserID
	}
	return val, nil
}
