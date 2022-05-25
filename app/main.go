package main

import (
	"fmt"
	"net/http"
)


func main() {
	http.HandleFunc("/", HelloWorld)

	http.ListenAndServe("localhost:9090", nil)
}

func HelloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, world! \n")
}
