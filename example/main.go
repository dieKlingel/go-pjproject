package main

import (
	"fmt"

	"github.com/dieklingel/go-pjproject/v2/pjsua2"
)

func main() {
	config := pjsua2.NewEpConfig()
	endpoint := pjsua2.NewEndpoint()
	endpoint.LibCreate()
	endpoint.LibInit(config)
	endpoint.LibStart()

	fmt.Println("An example PJSUA2 App")

	endpoint.LibDestroy()
}
