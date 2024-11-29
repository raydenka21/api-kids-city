package models

import (
	"github.com/goravel/framework/database/orm"
	"time"
)

type Voucher struct {
	orm.Model
	Code      string    `json:"code"`
	Status    string    `json:"status"`
	UsersId   int       `json:"users_id"`
	DevicesId string    `json:"devices_id"`
	RedeemAt  time.Time `json:"redeem_at"`
	RedeemBy  string    `json:"redeem_by"`
	Avatar    string    `json:"avatar"`
	orm.SoftDeletes
}
