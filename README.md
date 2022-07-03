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
docker build -t jokerthewild/rust-docker-nosccache .
docker images
docker run -it image
docker exec -it コンテナ名 bash
```

## DockerHUBへ登録

```bash
docker login
docker push jokerthewild/rust-docker-nosccache:latest
```
