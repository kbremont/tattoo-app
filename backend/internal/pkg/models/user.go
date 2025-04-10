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

type TattooStyle string

const (
	TattooStyleAmericanTraditional TattooStyle = "american_traditional"
	TattooStyleJapaneseTraditional TattooStyle = "japanese_traditional"
	TattooStyleRealism             TattooStyle = "realism"
	TattooStyleWatercolor          TattooStyle = "watercolor"
)

type User struct {
	Id               string
	Role             UserRole
	FirstName        string
	LastName         string
	StylePreferences []TattooStyle
	AvatarUrl        sql.NullString
	CreatedAt        time.Time
	UpdatedAt        time.Time
}
