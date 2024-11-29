package controllers

import (
	"fmt"
	"github.com/goravel/framework/contracts/database/orm"
	"github.com/goravel/framework/contracts/http"
	"github.com/goravel/framework/facades"
	"goravel/app/http/helper"
	"goravel/app/http/response"
	"goravel/app/models"
	"math/rand"
	"strconv"
	"time"
)

type UserController struct {
	//Dependent services
}

func NewUserController() *UserController {
	return &UserController{
		//Inject services
	}
}

func (r *UserController) Show(ctx http.Context) http.Response {
	return ctx.Response().Success().Json(http.Json{
		"Hello": "Goravel",
	})
}

func (r *UserController) Register(ctx http.Context) http.Response {
	validator, _ := ctx.Request().Validate(map[string]string{
		"name":     "required|max_len:50",
		"phone":    "required|max_len:20",
		"email":    "required|email",
		"password": "required",
		"avatar":   "required",
	})
	if validator.Fails() {
		messages := validator.Errors().All()
		return response.ApiResponse(ctx, 400, messages, "")
	}

	config := facades.Config()
	name := ctx.Request().Input("name")
	phone := ctx.Request().Input("phone")
	ip := ctx.Request().Ip()
	email := ctx.Request().Input("email")
	avatar := ctx.Request().Input("avatar")
	inputPassword := ctx.Request().Input("password")

	var findUser models.User

	errUser := facades.Orm().Query().Select("id", "phone").Where("phone", phone).First(&findUser)
	if errUser != nil {
		return response.ApiResponse(ctx, 500, errUser, "")
	}
	if findUser.Phone != "" {
		return response.ApiResponse(ctx, 400, "User Exist", "")
	}
	hasPassword := inputPassword + config.Env("HASH_KEY").(string)
	password := helper.CreateMd5Hash(hasPassword)

	createUser := models.User{Name: name, Email: email, Phone: phone, Avatar: avatar, Ip: ip, Password: password}
	saveUserErr := facades.Orm().Query().Create(&createUser)
	if saveUserErr != nil {
		return response.ApiResponse(ctx, 500, saveUserErr, "")
	}
	return response.ApiResponse(ctx, 201, "", "")
}
func (r *UserController) Auth(ctx http.Context) http.Response {

	phone := ctx.Request().Input("phone")
	email := ctx.Request().Input("email")
	deviceId := ctx.Request().Input("device_id")
	password := ctx.Request().Input("password")
	data := map[string]string{
		"password": "required",
	}
	if phone == "" && email == "" {
		return response.ApiResponse(ctx, 400, "Phone Or Email Not Empty", "")
	}
	authType := "phone"
	valueType := ""
	if phone == "" && email != "" {
		authType = "email"
		valueType = email
		data["email"] = "required|email"
	} else {
		valueType = phone
		data["phone"] = "required"
	}
	fmt.Println(authType)

	validator, _ := ctx.Request().Validate(data)
	if validator.Fails() {
		messages := validator.Errors().All()
		return response.ApiResponse(ctx, 400, messages, "")
	}
	var findUser models.User
	config := facades.Config()

	hasPassword := password + config.Env("HASH_KEY").(string)
	encryptPassword := helper.CreateMd5Hash(hasPassword)

	errUser := facades.Orm().Query().Scopes(Login(authType, valueType)).Select("id", "phone").Where("password", encryptPassword).First(&findUser)
	if errUser != nil {
		return response.ApiResponse(ctx, 500, errUser, "")
	}

	if findUser.Phone == "" {
		return response.ApiResponse(ctx, 404, "User Not Found", "")
	}

	randomizer := rand.New(rand.NewSource(time.Now().UTC().UnixNano())).Int()

	createToken := config.Env("TOKEN_KEY").(string) + strconv.Itoa(randomizer)
	generateToken, errHashToken := facades.Hash().Make(createToken)
	if errHashToken != nil {
		return response.ApiResponse(ctx, 500, errHashToken, "")
	}
	refreshToken := helper.RandomString(10)
	now := time.Now()
	expireAt := now.Add(time.Hour * 10)
	saveToken := models.Token{UsersId: findUser.ID, Token: generateToken, RefreshToken: refreshToken, ExpireAt: expireAt, Status: "active", DevicesId: deviceId}
	saveTokenErr := facades.Orm().Query().Create(&saveToken)
	if saveTokenErr != nil {
		return response.ApiResponse(ctx, 500, saveTokenErr, "")
	}
	return response.ApiResponse(ctx, 200, "success", saveToken)

}

func Login(authType string, valueType string) func(methods orm.Query) orm.Query {
	return func(query orm.Query) orm.Query {
		return query.Where(authType, valueType).WhereNotIn("status", []any{"blocked"})

	}
}
