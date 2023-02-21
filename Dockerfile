FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY main.go .
RUN go build main.go

### run step
FROM scratch

COPY --from=builder /app/main /main

ENTRYPOINT [ "./main" ]
