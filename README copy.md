# 新世界任务管理系统

[![CI/CD Pipeline](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/ci-cd.yml)
[![Quick Build](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/build.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/build.yml)
[![Docker Image](https://ghcr-badge.deta.dev/YOUR_USERNAME/YOUR_REPO/size)](https://github.com/YOUR_USERNAME/YOUR_REPO/pkgs/container/YOUR_REPO)
[![Release](https://img.shields.io/github/v/release/YOUR_USERNAME/YOUR_REPO)](https://github.com/YOUR_USERNAME/YOUR_REPO/releases/latest)

🎮 一个专为游戏公会设计的任务管理系统，支持多组机、多号机、多角色的任务追踪和进度管理。

## 🌟 功能特点

### 核心功能
- **多级任务管理**: 支持组机 → 号机 → 角色的三级管理结构
- **实时进度追踪**: 可视化进度条，实时显示完成情况
- **用户权限管理**: 管理员/员工双角色，权限分离
- **服务器批量管理**: 支持批量设置和管理游戏服务器

### 界面特色
- **响应式设计**: 支持桌面端和移动端
- **深色主题**: 护眼的渐变色深色主题
- **拖拽排序**: 支持窗口拖拽重新排序
- **快捷键操作**: 丰富的键盘快捷键支持

### 数据管理
- **本地存储**: 数据保存在浏览器本地
- **备份恢复**: 支持数据备份和恢复
- **多格式导出**: 支持Excel、CSV格式导出
- **搜索筛选**: 强大的搜索和筛选功能

## 🚀 快速部署

### 方式一：使用部署脚本（推荐）

**Windows用户：**
```bash
# 双击运行
deploy.bat
```

**Linux/Mac用户：**
```bash
# 给脚本执行权限
chmod +x deploy.sh

# 运行部署脚本
./deploy.sh
```

### 方式二：手动部署

#### 前置要求
- Docker
- Docker Compose

#### 构建和运行
```bash
# 1. 构建镜像
docker build -t nw-task-manager:latest .

# 2. 使用Docker Compose启动
docker-compose up -d

# 3. 查看状态
docker ps
```

#### 单独使用Docker
```bash
# 构建镜像
docker build -t nw-task-manager:latest .

# 运行容器
docker run -d \
  --name nw-task-manager \
  -p 80:80 \
  --restart unless-stopped \
  nw-task-manager:latest
```

### 方式三：自定义端口
如果80端口被占用，可以修改端口：

```bash
# 修改docker-compose.yml中的端口映射
ports:
  - "8080:80"  # 改为8080端口

# 或直接运行
docker run -d -p 8080:80 --name nw-task-manager nw-task-manager:latest
```

## 📱 访问应用

部署成功后，通过以下地址访问：

- **主应用**: http://localhost
- **健康检查**: http://localhost/health

### 默认账号
- **管理员**: 用户名 `admin`，密码 `admin`

## 🔧 配置说明

### Nginx配置
- 启用Gzip压缩
- 静态文件缓存优化
- 安全头设置
- 健康检查端点

### 容器配置
- 基于Alpine Linux的轻量级镜像
- 自动重启策略
- 健康检查机制
- 时区设置为Asia/Shanghai

## 📊 监控和维护

### 查看日志
```bash
# 查看容器日志
docker logs nw-task-manager

# 实时查看日志
docker logs -f nw-task-manager
```

### 容器管理
```bash
# 停止容器
docker stop nw-task-manager

# 重启容器
docker restart nw-task-manager

# 删除容器
docker rm nw-task-manager

# 删除镜像
docker rmi nw-task-manager:latest
```

### 数据备份
应用数据存储在浏览器本地存储中，建议定期使用应用内的备份功能。

## 🛠️ 开发说明

### 项目结构
```
.
├── index.html          # 主应用文件
├── Dockerfile          # Docker构建文件
├── docker-compose.yml  # Docker Compose配置
├── nginx.conf          # Nginx配置文件
├── deploy.sh          # Linux/Mac部署脚本
├── deploy.bat         # Windows部署脚本
├── .dockerignore      # Docker忽略文件
└── README.md          # 说明文档
```

### 技术栈
- **前端**: HTML5 + CSS3 + JavaScript (ES6+)
- **服务器**: Nginx
- **容器**: Docker + Docker Compose
- **存储**: LocalStorage

## 🔄 更新应用

1. 修改`index.html`文件
2. 重新构建镜像：`docker build -t nw-task-manager:latest .`
3. 重启容器：`docker-compose restart`

## 🐛 故障排除

### 常见问题

**1. 端口被占用**
```bash
# 查看端口占用
netstat -tulpn | grep :80

# 修改docker-compose.yml中的端口映射
```

**2. 容器启动失败**
```bash
# 查看详细错误信息
docker logs nw-task-manager
```

**3. 页面无法访问**
```bash
# 检查容器状态
docker ps

# 检查健康检查
curl http://localhost/health
```

## 📄 许可证

本项目仅供学习和内部使用。

## 🤝 贡献

欢迎提交Issues和Pull Requests来改进项目。