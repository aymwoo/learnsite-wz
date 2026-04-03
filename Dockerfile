# LearnSite Web 应用 Dockerfile
# 基于 Mono 运行时和 XSP4 Web 服务器

FROM mono:6.12

# 安装依赖
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 安装 XSP4 (Mono ASP.NET 服务器)
RUN apt-get update && apt-get install -y mono-xsp4 && rm -rf /var/lib/apt/lists/*

# 创建应用目录
WORKDIR /app

# 复制应用文件
COPY . /app

# 复制 docker 配置文件
COPY web.config.docker /app/web.config

# 修复 Mono SqlClient 非阻塞 Socket 异常的环境变量
ENV MONO_THREADS_PER_CPU=50
ENV MONO_TLS_PROVIDER=btls
ENV MONO_MANAGED_WATCHER=disabled
ENV MONO_DISABLE_AIO=1

# 暴露端口
EXPOSE 8080

# 启动命令
CMD ["xsp4", "--port", "8080", "--root", "/app", "--nonstop"]