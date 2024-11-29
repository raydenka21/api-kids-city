package voucher

import (
	"github.com/goravel/framework/database/orm"
)

type ListVoucher struct {
	Code      string `json:"code"`
	Status    string `json:"status"`
	DevicesId string `json:"devices_id"`
	orm.SoftDeletes
}

func (r *ListVoucher) TableName() string {
	return "vouchers"
}
