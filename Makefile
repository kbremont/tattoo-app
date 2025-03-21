APP_NAME=tattoo-app
DATABASE_URI?=postgres://postgres:password@localhost:5432/postgres

######### protobuf #########

buf-gen: buf-lint
	@cd api/proto/src && buf generate . --clean

buf-lint:
	@cd api/proto/src && buf lint


######### go test #########

test:
	@go test -v ./backend/...

######### go build #########

build:
	mkdir -p bin
	for dir in ./backend/cmd/*; do \
		if [ -d "$$dir" ]; then \
			name=$$(basename $$dir); \
			go build -o bin/$$name $$dir; \
		fi; \
	done

######### go formatting #########

fmt:
	@go fmt ./...

tidy:
	@go mod tidy

vendor:
	@go mod vendor

# lint:
# 	@golangci-lint run ./...

######### go run #########

run-auth:
	PORT_SERVICE=9000 DATABASE_URI=$(DATABASE_URI) ./bin/auth-service

run-user:
	PORT_SERVICE=9001 DATABASE_URI=$(DATABASE_URI) ./bin/user-service
