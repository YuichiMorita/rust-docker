# rust-docker

Dockerfile for diesel

- Centos7
- Rust
- diesel-cli(postgres)
- postgresql-devel
- gcc
- openssl

## Author

Yuichi Morita (info@reju.jp)

## 構築方法

```bash
docker build --no-cache -t jokerthewild/rust-docker .
docker images
docker run -it image
docker exec -it コンテナ名 bash
```

## DockerHUBへ登録

```bash
docker login
docker push jokerthewild/rust-docker:latest
```
