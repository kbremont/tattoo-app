APP_NAME=tattoo-app
DATABASE_URI?=postgresql://kyle.bremont@localhost:5432/tattoo_app?sslmode=disable

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
	cd backend && \
	for dir in ./cmd/*; do \
		if [ -d "$$dir" ]; then \
			name=$$(basename $$dir); \
			go build -o bin/$$name $$dir; \
		fi; \
	done

build-user-service:
	mkdir -p bin
	cd backend && go build -o bin/user-service ./cmd/user-service

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

run-user:
	PORT=9001 DATABASE_URI=$(DATABASE_URI) ./backend/bin/user-service


######### db migrations #########

migrate-down-user:
	DATABASE_URI=$(DATABASE_URI) MIGRATE_MODE=true MIGRATE_DOWN=true ./bin/user-service

migrate-up-user:
	DATABASE_URI=$(DATABASE_URI) MIGRATE_MODE=true MIGRATE_DOWN=false ./bin/user-service