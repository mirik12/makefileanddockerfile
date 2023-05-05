APP_NAME=$(shell basename $(shell git remote get-url origin))
REGISTRY=mirik12mirik
VERSION=1.0.0
USERNAME=mirik12mirik
//dont know

build-linux:
	GOOS=linux GOARCH=amd64 go build -o $(APP_NAME)_linux

build-arm:
	GOOS=linux GOARCH=arm64 go build -o $(APP_NAME)_arm64

build-macos:
	GOOS=darwin GOARCH=arm64 go build -o $(APP_NAME)_darwin_arm64

build-windows:
	GOOS=windows GOARCH=amd64 go build -o $(APP_NAME)_windows.exe

build-all:
	make build-linux
	make build-arm
	make build-macos
	make build-windows

docker-build:
	docker build -t $(REGISTRY)/$(USERNAME)/$(APP_NAME):$(VERSION) .

docker-push:
	docker push $(REGISTRY)/$(USERNAME)/$(APP_NAME):$(VERSION)
