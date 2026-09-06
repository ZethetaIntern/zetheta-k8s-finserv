# Build Stage
FROM golang:1.22-alpine AS builder
WORKDIR /app
RUN apk add --no-cache git ca-certificates
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o service .

# Runtime Stage - Minimal Distroless
FROM gcr.io/distroless/static:nonroot
WORKDIR /
COPY --from=builder /app/service /service
USER 65532:65532
ENTRYPOINT ["/service"]
