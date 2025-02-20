
run-server:
	@go run cmd/server/main.go

tidy:
	@go mod tidy

######### protobuf #########

buf-gen: buf-lint
	@buf generate --template api/proto/src/buf.gen.yaml ./api/proto/src

buf-lint:
	@buf lint