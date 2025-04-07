package models

import (
	"database/sql"
	"time"
)

type UserRole string

const (
	UserRoleArtist UserRole = "artist"
	UserRoleClient UserRole = "client"
)

type User struct {
	Id        string
	Role      UserRole
	FirstName string
	LastName  string
	AvatarUrl sql.NullString
	CreatedAt time.Time
	UpdatedAt time.Time
}
