@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo 🚀 开始部署新世界任务管理系统...

:: 检查Docker是否安装
docker --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker未安装，请先安装Docker
    pause
    exit /b 1
)

:: 停止现有容器
echo 📦 停止现有容器...
docker-compose down 2>nul

:: 构建镜像
echo 🔨 构建Docker镜像...
docker build -t nw-task-manager:latest .
if errorlevel 1 (
    echo ❌ 镜像构建失败
    pause
    exit /b 1
)

:: 启动服务
echo 🚢 启动服务...
docker-compose up -d
if errorlevel 1 (
    echo ❌ 服务启动失败
    pause
    exit /b 1
)

:: 等待服务启动
echo ⏳ 等待服务启动...
timeout /t 5 /nobreak >nul

:: 检查服务状态
docker ps | findstr nw-task-manager >nul
if errorlevel 1 (
    echo ❌ 部署失败！
    docker logs nw-task-manager
    pause
    exit /b 1
) else (
    echo ✅ 部署成功！
    echo 🌐 应用访问地址: http://localhost:80
    echo 💡 健康检查: http://localhost:80/health
    echo.
    echo 📊 容器状态:
    docker ps | findstr nw-task-manager
)

echo.
echo 🎉 部署完成！
pause