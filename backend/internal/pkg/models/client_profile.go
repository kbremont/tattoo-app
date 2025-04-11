package models

import "time"

type ClientProfile struct {
	UserID    string
	Location  string
	CreatedAt time.Time
	UpdatedAt time.Time
}
