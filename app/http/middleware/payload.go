package middleware

import (
	"github.com/goravel/framework/contracts/http"
)

func Payload() http.Middleware {
	return func(ctx http.Context) {
		payload := ctx.Request().All()
		if len(payload) == 0 {
			ctx.Request().AbortWithStatus(400)
		}
		ctx.Request().Next()
	}
}
