APP_NAME=tattoo-app
DATABASE_URI?=postgresql://kyle.bremont@localhost:5432/tattooapp?sslmode=disable
NGROK_TUNNELS_URL=http://localhost:4040/api/tunnels
ENV_FILE=frontend/tattooapp/.env

######### protobuf #########

buf-gen: buf-lint
	@cd api/proto/src && buf generate . --clean

buf-lint:
	@cd api/proto/src && buf lint


######### go test #########

test:
	@go test -v ./backend/...

######### go build #########

build-all:
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

build-artist-service:
	mkdir -p bin
	cd backend && go build -o bin/artist-service ./cmd/artist-service

build-client-service:
	mkdir -p bin
	cd backend && go build -o bin/client-service ./cmd/client-service

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

start-services:
	@echo "Starting all services..."
	@make start-user &
	@make start-artist &
	@make start-client &
	@wait

start-user:
	PORT=9001 DATABASE_URI=$(DATABASE_URI) ./backend/bin/user-service

start-artist:
	PORT=9000 DATABASE_URI=$(DATABASE_URI) ./backend/bin/artist-service

start-client:
	PORT=9002 DATABASE_URI=$(DATABASE_URI) ./backend/bin/client-service

stop-services:
	@echo "Killing processes on ports 9000, 9001, 9002..."
	@lsof -ti tcp:9000 | xargs kill -9 || true
	@lsof -ti tcp:9001 | xargs kill -9 || true
	@lsof -ti tcp:9002 | xargs kill -9 || true

######### db migrations #########

migrate-down-user:
	DATABASE_URI=$(DATABASE_URI) MIGRATE_MODE=true MIGRATE_DOWN=true ./bin/user-service

migrate-up-user:
	DATABASE_URI=$(DATABASE_URI) MIGRATE_MODE=true MIGRATE_DOWN=false ./bin/user-service

######### flutter dev #########

start-ngrok:
	@echo "Starting ngrok..."
	@ngrok start --all > /dev/null & \
	sleep 5 && \
	make update-env

## Fetch public URLs from ngrok and write them into .env
update-env:
	@echo "Fetching ngrok tunnel URLs..."
	@curl -s $(NGROK_TUNNELS_URL) > tunnels.json

	@USER_URL=$$(jq -r '.tunnels[] | select(.name=="user-service") | .public_url' tunnels.json) && \
	ARTIST_URL=$$(jq -r '.tunnels[] | select(.name=="artist-service") | .public_url' tunnels.json) && \
	CLIENT_URL=$$(jq -r '.tunnels[] | select(.name=="client-service") | .public_url' tunnels.json) && \
	echo "USER_SERVICE_BASE_URL=$${USER_URL}" > $(ENV_FILE) && \
	echo "ARTIST_SERVICE_BASE_URL=$${ARTIST_URL}" >> $(ENV_FILE) && \
	echo "CLIENT_SERVICE_BASE_URL=$${CLIENT_URL}" >> $(ENV_FILE) && \
	echo "✅ Updated .env file at $(ENV_FILE)" && \
	cat $(ENV_FILE) && \
	rm tunnels.json

## Kill any running ngrok process
stop-ngrok:
	@echo "Stopping ngrok..."
	@pkill ngrok || echo "No ngrok process found."
