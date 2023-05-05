FROM golang:1.20 as builder

ARG APP_NAME
ARG REGISTRY
ARG USERNAME
ARG VERSION

WORKDIR /app
COPY . .
RUN

FROM alpine:3.14.2
ARG APP_NAME
ARG REGISTRY
ARG USERNAME
ARG VERSION
COPY --from=builder /app/$(APP_NAME)_linux /$(APP_NAME)
COPY --from=builder /app/$(APP_NAME)_arm64 /$(APP_NAME)_arm64
COPY --from=builder /app/$(APP_NAME)_darwin_arm64 /$(APP_NAME)_darwin_arm64
COPY --from=builder /app/$(APP_NAME)_windows.exe /$(APP_NAME).exe
CMD ["/$(APP_NAME)"]
