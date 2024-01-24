# 使用Alpine最新镜像作为基础镜像
FROM alpine:latest

# 安装必要的工具
RUN apk update && \
    apk add --no-cache curl

# 创建名为game的目录
RUN mkdir /game

# 下载文件到game目录
RUN curl -L -o /game/server https://github.com/D3-3109/i-need-a-repo-to-release-the-launchers/releases/download/0/server

# 给下载的文件添加可执行权限
RUN chmod +x /game/server

# 设置容器的工作目录为game目录
WORKDIR /game

# 运行服务器
CMD ./server --bot-percent 95 --http-port 37550

# 暴露端口
EXPOSE 37550
