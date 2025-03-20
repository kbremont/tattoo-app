package models

import (
	"time"

	"github.com/google/uuid"
)

type AuthAccount struct {
	UserID       uuid.UUID
	Email        string
	PasswordHash string
	IsVerified   bool
	CreatedAt    time.Time
	UpdatedAt    time.Time
}
