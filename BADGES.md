# GitHub Actions 状态徽章

将以下徽章添加到你的 README.md 文件中：

## 🔄 工作流状态

### 主要 CI/CD 流水线
```markdown
[![CI/CD Pipeline](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/ci-cd.yml)
```

### 快速构建
```markdown
[![Quick Build](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/build.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/build.yml)
```

### 多平台构建
```markdown
[![Multi-Platform Build](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/multi-platform.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/multi-platform.yml)
```

### 发布管理
```markdown
[![Release](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/release.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/release.yml)
```

## 📦 包状态

### Docker 镜像
```markdown
[![Docker Image Size](https://ghcr-badge.deta.dev/YOUR_USERNAME/YOUR_REPO/size)](https://github.com/YOUR_USERNAME/YOUR_REPO/pkgs/container/YOUR_REPO)
```

### 最新版本
```markdown
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/YOUR_USERNAME/YOUR_REPO)](https://github.com/YOUR_USERNAME/YOUR_REPO/releases/latest)
```

### 下载统计
```markdown
[![GitHub all releases](https://img.shields.io/github/downloads/YOUR_USERNAME/YOUR_REPO/total)](https://github.com/YOUR_USERNAME/YOUR_REPO/releases)
```

## 📊 项目统计

### 代码质量
```markdown
[![CodeFactor](https://www.codefactor.io/repository/github/YOUR_USERNAME/YOUR_REPO/badge)](https://www.codefactor.io/repository/github/YOUR_USERNAME/YOUR_REPO)
```

### 许可证
```markdown
[![License](https://img.shields.io/github/license/YOUR_USERNAME/YOUR_REPO)](https://github.com/YOUR_USERNAME/YOUR_REPO/blob/main/LICENSE)
```

### 语言统计
```markdown
[![GitHub top language](https://img.shields.io/github/languages/top/YOUR_USERNAME/YOUR_REPO)](https://github.com/YOUR_USERNAME/YOUR_REPO)
```

## 🔗 完整示例

将以下内容添加到你的 README.md 顶部：

```markdown
# 新世界任务管理系统

[![CI/CD Pipeline](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/ci-cd.yml)
[![Quick Build](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/build.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/build.yml)
[![Multi-Platform Build](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/multi-platform.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/multi-platform.yml)
[![Release](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/release.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/release.yml)

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/YOUR_USERNAME/YOUR_REPO)](https://github.com/YOUR_USERNAME/YOUR_REPO/releases/latest)
[![Docker Image Size](https://ghcr-badge.deta.dev/YOUR_USERNAME/YOUR_REPO/size)](https://github.com/YOUR_USERNAME/YOUR_REPO/pkgs/container/YOUR_REPO)
[![GitHub all releases](https://img.shields.io/github/downloads/YOUR_USERNAME/YOUR_REPO/total)](https://github.com/YOUR_USERNAME/YOUR_REPO/releases)
[![License](https://img.shields.io/github/license/YOUR_USERNAME/YOUR_REPO)](https://github.com/YOUR_USERNAME/YOUR_REPO/blob/main/LICENSE)

🎮 一个专为游戏公会设计的任务管理系统，支持多组机、多号机、多角色的任务追踪和进度管理。
```

## 📝 使用说明

1. 将 `YOUR_USERNAME` 替换为你的 GitHub 用户名
2. 将 `YOUR_REPO` 替换为你的仓库名称
3. 根据需要调整徽章样式和颜色

## 🎨 自定义样式

你可以通过添加参数来自定义徽章外观：

```markdown
[![Build Status](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/ci-cd.yml/badge.svg?style=for-the-badge)](https://github.com/YOUR_USERNAME/YOUR_REPO/actions/workflows/ci-cd.yml)
```

可用样式：
- `?style=flat` (默认)
- `?style=flat-square`
- `?style=for-the-badge`
- `?style=plastic`