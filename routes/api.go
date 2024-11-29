package routes

import (
	"github.com/goravel/framework/contracts/route"
	"github.com/goravel/framework/facades"
	"goravel/app/http/controllers"
	"goravel/app/http/middleware"
)

func Api() {
	userController := controllers.NewUserController()

	facades.Route().Group(func(router route.Router) {
		facades.Route().Prefix("users").Get("/", userController.Show)
		facades.Route().Middleware(middleware.Payload()).Prefix("users").Post("/auth", userController.Auth)
		facades.Route().Middleware(middleware.Payload()).Prefix("users").Post("/register", userController.Register)
		facades.Route().Prefix("users").Get("/{id}", userController.Show)
	})
	voucherController := controllers.NewVoucherController()

	facades.Route().Middleware(middleware.Payload()).Post("/vouchers/redeem", voucherController.Redeem)

	facades.Route().Get("/vouchers", voucherController.Index)
	facades.Route().Get("/vouchers/generate", voucherController.Generate)

	transactionController := controllers.NewTransactionController()

	facades.Route().Get("/transaction", transactionController.Create)

	//facades.Route().Prefix("users").Group(func(router route.Router) {
	//	facades.Route().Post("/auth", userController.Auth)
	//	facades.Route().Post("/register", userController.Register)
	//	facades.Route().Get("/{id}", userController.Show)
	//
	//})

}
