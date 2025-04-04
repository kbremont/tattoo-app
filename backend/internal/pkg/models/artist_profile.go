package models

import "time"

type ArtistProfile struct {
	UserID     string
	Bio        string
	Location   string
	TattooShop string
	CreatedAt  time.Time
	UpdatedAt  time.Time
}
