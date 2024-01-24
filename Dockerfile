# 使用Alpine最新镜像作为基础镜像
FROM alpine:latest

# 设置环境变量
ENV SERVER_URL=https://github.com/D3-3109/i-need-a-repo-to-release-the-launchers/releases/download/0/server \
    WORKDIR=/game \
    HTTP_PORT=37550

# 安装必要的工具（包括curl）
RUN apk update && \
    apk add --no-cache curl


# 创建工作目录
RUN mkdir -p $WORKDIR

# 设置容器的工作目录为工作目录
WORKDIR $WORKDIR

# 下载server文件并添加可执行权限
RUN curl -L $SERVER_URL -o $WORKDIR/server && \
    chmod +x $WORKDIR/server

# 设置entrypoint
ENTRYPOINT ["./server", "--bot-percent", "95", "--http-port", "$HTTP_PORT"]

# 暴露端口
EXPOSE $HTTP_PORT
