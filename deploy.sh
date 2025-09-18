#!/bin/bash

# 新世界任务管理系统部署脚本

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 应用配置
APP_NAME="nw-task-manager"
IMAGE_NAME="nw-task-manager:latest"
PORT="80"

echo -e "${GREEN}🚀 开始部署新世界任务管理系统...${NC}"

# 检查Docker是否安装
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker未安装，请先安装Docker${NC}"
    exit 1
fi

# 检查Docker Compose是否安装
if ! command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}⚠️  Docker Compose未找到，尝试使用docker compose...${NC}"
    DOCKER_COMPOSE_CMD="docker compose"
else
    DOCKER_COMPOSE_CMD="docker-compose"
fi

# 停止现有容器
echo -e "${YELLOW}📦 停止现有容器...${NC}"
$DOCKER_COMPOSE_CMD down 2>/dev/null || true

# 构建镜像
echo -e "${YELLOW}🔨 构建Docker镜像...${NC}"
docker build -t $IMAGE_NAME .

# 启动服务
echo -e "${YELLOW}🚢 启动服务...${NC}"
$DOCKER_COMPOSE_CMD up -d

# 等待服务启动
echo -e "${YELLOW}⏳ 等待服务启动...${NC}"
sleep 5

# 检查服务状态
if docker ps | grep -q $APP_NAME; then
    echo -e "${GREEN}✅ 部署成功！${NC}"
    echo -e "${GREEN}🌐 应用访问地址: http://localhost:$PORT${NC}"
    echo -e "${GREEN}💡 健康检查: http://localhost:$PORT/health${NC}"
    
    # 显示容器状态
    echo -e "\n${YELLOW}📊 容器状态:${NC}"
    docker ps | grep $APP_NAME
    
    # 显示日志
    echo -e "\n${YELLOW}📋 最近日志:${NC}"
    docker logs $APP_NAME --tail 10
else
    echo -e "${RED}❌ 部署失败！${NC}"
    echo -e "${RED}📋 错误日志:${NC}"
    docker logs $APP_NAME --tail 20
    exit 1
fi

echo -e "\n${GREEN}🎉 部署完成！${NC}"