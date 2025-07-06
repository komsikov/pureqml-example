# Docker

## Build base docker image

```bash
docker build --platform=linux/amd64 -t pureqml -f Dockerfile.baseimage .
```

## Build pureqml-example app

```bash
docker build -t pureqml-app .
```

## create androidTV apk

```bash
docker run -it --name pureqml-example -v ./build.androidtv:/app/build.androidtv pureqml-app
```
