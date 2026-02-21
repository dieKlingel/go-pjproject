# go-pjproject

Go Bindings for [pjsua2](https://github.com/pjsip/pjproject)

## Getting Started

```sh
go get github.com/dieklingel/go-pjproject
```

```go
import (
	"github.com/dieklingel/go-pjproject/pjsua2"
)

func main() {
	config := pjsua2.NewEpConfig()
	endpoint := pjsua2.NewEndpoint()
	endpoint.LibCreate()
	endpoint.LibInit(config)
	endpoint.LibStart()

    ...

    enpoint.LibDestroy()
}
```

## Develop

### Generate Bindings

1. Checkout the pjproject version, for which bindings should be generated.

```sh
cd 3rdparty/pjproject
git checkout 2.16
cd ../../../
```

2. Generate Bindings

```sh
# setup dev environment
nix develop -c $SHELL
bash build/generate.sh
```
