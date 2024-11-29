package controllers

import (
	"fmt"
	"github.com/goravel/framework/contracts/http"
	"goravel/app/http/response"
)

type TransactionController struct {
	//Dependent services
}

func NewTransactionController() *TransactionController {
	return &TransactionController{
		//Inject services
	}
}

type DataTransaction struct {
	DataLog         any
	DataTransaction any
}

func (r *TransactionController) Create(ctx http.Context) http.Response {
	channel1 := make(chan any)
	channel2 := make(chan any)
	defer close(channel1)
	defer close(channel2)

	go CreateLog(channel1)
	go CreateTransaction(channel2)
	counter := 0

	var transaction DataTransaction
	for {
		select {
		case dataLog := <-channel1:
			fmt.Println("Data dari channel 1", dataLog)
			transaction.DataLog = dataLog
			counter++
		case dataTransaction := <-channel2:
			fmt.Println("Data dari channel 2", dataTransaction)
			transaction.DataTransaction = dataTransaction
			counter++
		}
		if counter == 2 {
			break
		}
	}
	if transaction.DataLog != "success" {
		return response.ApiResponse(ctx, 400, "failed", counter)
	}

	return response.ApiResponse(ctx, 200, "success", counter)

}

func CreateLog(channel chan any) {
	channel <- "Log Success"
	fmt.Println("task 1")
	//time.Sleep(5 * time.Second)
}

func CreateTransaction(channel chan any) {
	channel <- "Transaction Success"
	fmt.Println("task 2")
	//time.Sleep(5 * time.Second)
}
