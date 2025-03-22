package models

import (
	"time"
)

type User struct {
	Auth0UserID string
	FirstName   string
	LastName    string
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
