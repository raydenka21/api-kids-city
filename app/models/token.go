package models

import (
	"github.com/goravel/framework/database/orm"
	"time"
)

type Token struct {
	orm.Model
	UsersId      int       `json:"users_id"`
	Token        string    `json:"token"`
	RefreshToken string    `json:"refresh_token"`
	Status       string    `json:"status"`
	ExpireAt     time.Time `json:"expire_at"`
	DevicesId    string    `json:"device_id"`
	orm.SoftDeletes
}
