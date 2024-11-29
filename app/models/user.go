package models

import (
	"github.com/goravel/framework/database/orm"
)

type User struct {
	orm.Model
	ID       int    `json:"id"`
	Name     string `json:"name"`
	Avatar   string `json:"avatar"`
	Email    string `json:"email"`
	Ip       string `json:"ip"`
	Password string `json:"-""`
	Phone    string `json:"phone"`
	orm.SoftDeletes
}
