ARG G_VERSION=1.20-alpine3.17
ARG A_VERSION=3.17

FROM golang:${G_VERSION} AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY main.go .

RUN go build -o main .

FROM alpine:${A_VERSION}

# Install curl 
RUN apk update && apk add curl

WORKDIR /app

COPY --from=builder /app/main .
COPY public public 
COPY templates templates 

ENV PORT=3000 INSTANCE_NAME=do-bear GIN_MODE=release

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
   CMD curl http://localhost:${PORT}/healthz || exit 1

ENTRYPOINT /app/main