package helper

import (
	"crypto/md5"
	"encoding/hex"
	"io"
	"math/rand"
	"time"
)

func RandomString(length int) string {
	var letters = []rune("abcdefg123hijklmnopqrstu456vwxyz789ABCDEFGHIJKL0MNOPQRSTUVWXYZ")
	var randomizer = rand.New(rand.NewSource(time.Now().UTC().UnixNano()))
	b := make([]rune, length)
	for i := range b {
		b[i] = letters[randomizer.Intn(len(letters))]
	}
	return string(b)
}

func CreateMd5Hash(text string) string {
	hasher := md5.New()
	_, err := io.WriteString(hasher, text)
	if err != nil {
		panic(err)
	}
	return hex.EncodeToString(hasher.Sum(nil))
}
