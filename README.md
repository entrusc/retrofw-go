# retrofw-go
Go build environment including cross compilation toolchain to build SDL dependencies

* A simple environment based on the go docker image that also contains the tool chain from here: https://github.com/retrofw/buildroot/releases
* Configured environment variables are `GOOS`, `GOARCH`, `GOMIPS`, `CGO_ENABLED`, `CC`, `CGO_CFLAGS` & `CGO_LDFLAGS` (to set the proper include path for SDL libs)

## how to use in Go
```go
/*
#cgo LDFLAGS: -lSDL
#include <SDL.h>
*/
import "C"

/* ... */

func Init(flags uint32) int { return int(C.SDL_Init(C.Uint32(flags))) }
```

## how to build using this image
```bash
docker run --rm -it -v $PWD:/src -w /src entrusc/retrofw-go go build -a
```
after that comment you should have a `MIPSLE` executable sitting in the project folder that you only need to transfer to your RetroFW device.
