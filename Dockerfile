# 使用nginx作为基础镜像
FROM nginx:alpine

# 维护者信息
LABEL maintainer="your-email@example.com"
LABEL description="新世界任务管理系统"
LABEL version="1.0"

# 创建工作目录
WORKDIR /usr/share/nginx/html

# 复制HTML文件到nginx默认目录
COPY index.html .

# 复制nginx配置文件
COPY nginx.conf /etc/nginx/nginx.conf

# 创建nginx用户（如果不存在）
RUN addgroup -g 101 -S nginx || true

# 设置正确的权限
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

# 暴露80端口
EXPOSE 80

# 健康检查
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/health || exit 1

# 启动nginx
CMD ["nginx", "-g", "daemon off;"]