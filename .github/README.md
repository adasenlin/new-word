# GitHub Actions 工作流说明

本项目包含了完整的 CI/CD 工作流配置，支持自动构建、测试、发布和部署。

## 📋 工作流概览

### 1. 🚀 主要 CI/CD 流水线 (`ci-cd.yml`)

**触发条件：**
- `main` 和 `develop` 分支的推送
- 标签推送 (`v*`)
- 对 `main` 分支的 Pull Request

**功能：**
- 代码质量检查
- Docker 镜像构建和测试
- 安全扫描 (Trivy)
- 自动部署到演示环境
- 创建 GitHub Release
- 生产环境部署

### 2. ⚡ 快速构建 (`build.yml`)

**触发条件：**
- 所有分支推送 (`main`, `develop`, `feature/*`)
- 手动触发

**功能：**
- 快速构建单平台镜像 (linux/amd64)
- 自动推送到 GitHub Container Registry
- 分支和 SHA 标签管理

### 3. 🌐 多平台构建 (`multi-platform.yml`)

**触发条件：**
- 每周日定时构建
- 手动触发（可选择平台）

**功能：**
- 支持多架构构建 (amd64, arm64, armv7)
- 创建多平台 manifest
- 完整的平台兼容性测试

### 4. 🔥 缓存预热 (`cache-warmup.yml`)

**触发条件：**
- 每日定时执行
- 手动触发

**功能：**
- 预热构建缓存，提升构建速度
- 多平台缓存管理
- 缓存状态监控

### 5. 📦 发布管理 (`release.yml`)

**触发条件：**
- 版本标签推送 (`v*`)
- 手动触发（指定版本）

**功能：**
- 自动生成 changelog
- 创建 GitHub Release
- 多平台发布镜像
- 版本标签管理

## 🔧 配置要求

### 必需的 Secrets

项目无需额外配置 secrets，使用内置的 `GITHUB_TOKEN` 即可。

### 权限设置

确保仓库设置中启用了以下权限：
- **Actions**: `write`
- **Contents**: `write`
- **Packages**: `write`
- **Security events**: `write`

## 🚀 使用指南

### 自动构建

1. **推送代码自动构建**
   ```bash
   git push origin main
   # 触发完整的 CI/CD 流水线
   ```

2. **功能分支构建**
   ```bash
   git push origin feature/new-feature
   # 触发快速构建
   ```

### 手动触发

1. **快速构建**
   - 进入 Actions 页面
   - 选择 "Quick Build"
   - 点击 "Run workflow"

2. **多平台构建**
   - 选择 "Multi-Platform Build"
   - 可选择目标平台
   - 点击 "Run workflow"

### 版本发布

1. **创建版本标签**
   ```bash
   git tag -a v1.0.0 -m "Release v1.0.0"
   git push origin v1.0.0
   # 自动触发发布流程
   ```

2. **手动创建发布**
   - 进入 Actions 页面
   - 选择 "Release Management"
   - 输入版本号（如 v1.0.1）
   - 选择是否为预发布版本
   - 点击 "Run workflow"

## 📊 构建产物

### Docker 镜像标签规则

- **主分支**: `ghcr.io/your-repo:main`
- **开发分支**: `ghcr.io/your-repo:develop`
- **功能分支**: `ghcr.io/your-repo:feature-name`
- **版本标签**: `ghcr.io/your-repo:v1.0.0`
- **latest**: `ghcr.io/your-repo:latest` (仅稳定版本)

### 支持的平台

- **linux/amd64** - x86_64 架构
- **linux/arm64** - ARM64 架构
- **linux/arm/v7** - ARMv7 架构

## 🔍 监控和调试

### 查看构建状态

1. **Actions 页面**
   - 查看工作流运行状态
   - 下载构建日志
   - 查看错误详情

2. **Package 页面**
   - 查看发布的镜像
   - 镜像下载统计
   - 版本历史

### 常见问题

**1. 构建失败**
```bash
# 检查 Dockerfile 语法
docker build -t test .

# 本地测试工作流
act -j build-and-test
```

**2. 权限错误**
```bash
# 检查 GITHUB_TOKEN 权限
# 确保仓库设置中启用了必要权限
```

**3. 缓存问题**
```bash
# 手动清理缓存
# 在 Actions 页面删除旧的缓存条目
```

## 🛠️ 自定义配置

### 修改构建平台

编辑 `.github/workflows/multi-platform.yml`:
```yaml
strategy:
  matrix:
    include:
      - platform: linux/amd64
      - platform: linux/arm64
      # 添加或移除平台
```

### 调整构建频率

编辑定时任务 cron 表达式:
```yaml
schedule:
  - cron: '0 2 * * 0'  # 每周日 2:00
  - cron: '0 1 * * *'  # 每天 1:00
```

### 自定义部署环境

在 `ci-cd.yml` 中添加部署步骤:
```yaml
- name: Deploy to production
  run: |
    # 添加你的部署脚本
    kubectl apply -f k8s/
```

## 📈 性能优化

### 构建时间优化

1. **使用构建缓存**
   - GitHub Actions Cache
   - Docker layer caching
   - Multi-stage builds

2. **并行构建**
   - 矩阵策略
   - 依赖最小化
   - 分阶段构建

3. **缓存预热**
   - 定时缓存更新
   - 分平台缓存管理

### 存储优化

1. **镜像大小优化**
   - Alpine 基础镜像
   - Multi-stage builds
   - 最小化依赖

2. **清理策略**
   - 自动删除旧版本
   - 保留策略配置
   - 定期清理缓存

## 🔒 安全最佳实践

1. **镜像扫描**
   - Trivy 安全扫描
   - 依赖漏洞检查
   - 基础镜像更新

2. **权限控制**
   - 最小权限原则
   - Token 生命周期管理
   - 环境隔离

3. **代码保护**
   - 分支保护规则
   - 必需的状态检查
   - 审查要求

## 📞 获取帮助

- **Issues**: 报告问题和建议
- **Discussions**: 技术讨论和问答
- **Wiki**: 详细文档和教程