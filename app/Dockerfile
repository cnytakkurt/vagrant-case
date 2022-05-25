FROM golang:latest
WORKDIR /src
RUN CGO_ENABLED=0 go build -o /bin/app .

FROM alpine
COPY --from=0 /bin/app /bin/app
ENTRYPOINT [ "/bin/app" ]