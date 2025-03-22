package auth

import (
	"context"
	"errors"
)

var ErrUnauthorized = errors.New("permission denied")

// EnsureSameUser checks if the caller's auth0_user_id matches the target user ID
func EnsureSameUser(ctx context.Context, targetAuth0ID string) error {
	callerID, err := GetAuth0UserID(ctx)
	if err != nil {
		return err // fallback to unauthenticated
	}
	if callerID != targetAuth0ID {
		return ErrUnauthorized
	}
	return nil
}
