FROM golang:1.23 as BUILDER

# ARG BUILD_DIR

WORKDIR /workspace

COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download

COPY . ./

RUN CGO_ENABLED=0 go build -o /app ./cmd/user-service

# Final stage with minimal dependencies
FROM gcr.io/distroless/static

COPY --from=BUILDER /app /app

# Add default.conf to nginx configuration path
# ENTRYPOINT ["/app"]
CMD ["./app"]