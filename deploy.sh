#!/bin/sh

# 一键发布脚本：提交当前页面并推送到 GitHub
# 使用方法：
#   sh deploy.sh "更新说明"
# 如果没有提供提交信息，默认使用 "update site"。

set -e

COMMIT_MSG=${1:-"update site"}
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

if [ ! -d .git ]; then
  echo "[deploy] Git 仓库未初始化，正在初始化..."
  git init
  git branch -M main
fi

if git remote | grep -q '^origin$'; then
  echo "[deploy] 远程 origin 已配置。"
else
  echo "[deploy] 远程 origin 未配置。"
  echo "请先运行：git remote add origin https://github.com/<你的用户名>/meixilexue-page.git"
  exit 1
fi

echo "[deploy] 添加变更..."
git add .

if git diff --cached --quiet; then
  echo "[deploy] 没有待提交的更改。"
else
  echo "[deploy] 提交变更：$COMMIT_MSG"
  git commit -m "$COMMIT_MSG"
fi

echo "[deploy] 推送到 GitHub..."
git push origin main

echo "[deploy] 完成！如果已启用 GitHub Pages，网站会在几分钟内更新。"
