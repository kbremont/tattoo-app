package models

import (
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
	AvatarUrl string
	CreatedAt time.Time
	UpdatedAt time.Time
}
