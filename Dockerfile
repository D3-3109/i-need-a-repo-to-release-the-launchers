# 使用Alpine最新镜像作为基础镜像
FROM alpine:latest

# 安装必要的工具
RUN apk update && \
    apk add --no-cache curl

# 下载文件
RUN curl -L -o server https://github.com/D3-3109/i-need-a-repo-to-release-the-launchers/releases/download/0/server

# 给下载的文件添加可执行权限
RUN chmod +x server

# 设置容器的工作目录
WORKDIR /

# 运行服务器
CMD ./server --bot-percent 95 --http-port 37550

# 暴露端口
EXPOSE 37550
