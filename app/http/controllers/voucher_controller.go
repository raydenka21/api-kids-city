package controllers

import (
	"github.com/goravel/framework/contracts/http"
	"github.com/goravel/framework/facades"
	"goravel/app/http/helper"
	"goravel/app/http/response"
	"goravel/app/models"
	"goravel/app/models/voucher"
	"time"
)

type VoucherController struct {
	//Dependent services
}

func NewVoucherController() *VoucherController {
	return &VoucherController{
		//Inject services
	}
}

func (r *VoucherController) Index(ctx http.Context) http.Response {
	page := ctx.Request().QueryInt("page")
	limit := ctx.Request().QueryInt("limit")
	if limit > 100 {
		limit = 100
	} else if limit < 1 {
		limit = 10
	}
	if page == 0 {
		page = 1
	}
	start := (page - 1) * limit
	var voucher []voucher.ListVoucher
	err := facades.Orm().Query().Select("code", "status", "devices_id").Offset(start).Limit(limit).OrderBy("status", "desc").Get(&voucher)
	if err != nil {
		facades.Log().Debug(err)
		return response.ApiResponse(ctx, 500, "", "")
	}
	return response.ApiResponse(ctx, 200, "success", voucher)
}
func (r *VoucherController) Redeem(ctx http.Context) http.Response {
	validator, _ := ctx.Request().Validate(map[string]string{
		"code": "required",
	})
	if validator.Fails() {
		messages := validator.Errors().All()
		return response.ApiResponse(ctx, 400, messages, "")
	}
	code := ctx.Request().Input("code")
	var findVoucher models.Voucher

	errUser := facades.Orm().Query().Select("id", "code", "status").Where("code", code).Where("status", "not-redeem").First(&findVoucher)
	if errUser != nil {
		return response.ApiResponse(ctx, 500, errUser, "")
	}
	if findVoucher.Code == "" {
		return response.ApiResponse(ctx, 404, "Voucher Not Exist", "")
	}

	result, saveDbErr := facades.Orm().Query().Model(&models.Voucher{}).Where("code", code).Update(models.Voucher{Status: "redeem", RedeemAt: time.Now()})
	if saveDbErr != nil {
		print(saveDbErr)
		return response.ApiResponse(ctx, 500, "", "")
	}
	return response.ApiResponse(ctx, 200, result, "")
}

func (r *VoucherController) Generate(ctx http.Context) http.Response {
	page := ctx.Request().QueryInt("count")
	var voucherResponses []models.Voucher
	sum := 0
	for i := 0; i < page; i++ {
		var newVoucher models.Voucher
		generateVoucher := helper.RandomString(20)
		newVoucher.Code = generateVoucher
		newVoucher.Status = "not-redeem"
		newVoucher.UsersId = 27
		voucherResponses = append(voucherResponses, newVoucher)
		sum += i
	}
	tx, _ := facades.Orm().Query().Begin()
	if err := tx.Create(&voucherResponses); err != nil {
		errRollback := tx.Rollback()
		if errRollback != nil {
			return response.ApiResponse(ctx, 500, "Rollback Failed", "")
		}
	} else {
		errCommit := tx.Commit()
		if errCommit != nil {
			return response.ApiResponse(ctx, 500, "Commit Failed", "")
		}
	}
	return response.ApiResponse(ctx, 200, "success", "")

}

//func (r *VoucherController) Show(ctx http.Context) http.Response {
//	return nil
//}
//
//func (r *VoucherController) Store(ctx http.Context) http.Response {
//	return nil
//}
//
//func (r *VoucherController) Update(ctx http.Context) http.Response {
//	return nil
//}
//
//func (r *VoucherController) Destroy(ctx http.Context) http.Response {
//	return nil
//}
