package dao

import (
"database/sql"

//after using
_ "github.com/mattn/go-sqlite3"
)

func getdb() (*sql.DB, error) {
	db, err := sql.Open("sqlite3", "E:\\jkl\\liode\\goProjects\\src\\51hk_beego\\app_data\\jzh")
	return db, err
}
