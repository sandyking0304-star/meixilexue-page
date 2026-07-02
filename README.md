# 美熙乐学 页面 GitHub Pages 发布流程

这是一个静态网站项目，可以直接发布到 GitHub Pages。以下步骤适用于你已经在本地创建了 `skill/meixilexue-page` 页面。

## 1. 注册 GitHub 账号

如果你还没有 GitHub 账号，请先访问：
- https://github.com

注册完成后登录。

## 2. 创建 GitHub 仓库

1. 点击右上角你的头像，选择 `Your repositories`。
2. 点击 `New` 按钮。
3. 仓库名称建议：`meixilexue-page` 或你喜欢的名称。
4. 描述可选：`美熙乐学个人文章页面`。
5. 选择 `Public`（公开仓库）。
6. 不要勾选 `Initialize this repository with a README`（如果你想自己上传本地文件）。
7. 点击 `Create repository`。

## 3. 在本地项目目录初始化 Git

打开终端，执行：

```bash
cd ~/skill/meixilexue-page
git init
```

如果你已经初始化过仓库，可以跳过这一步。

## 4. 添加文件并提交

```bash
git add .
git commit -m "初始化美熙乐学页面"
```

## 5. 连接远程仓库

将下面命令中的 `<你的用户名>` 和仓库名替换成你自己的：

```bash
git branch -M main
git remote add origin https://github.com/<你的用户名>/meixilexue-page.git
git push -u origin main
```

如果远程仓库已存在并且你之前已经设置过 `origin`，可以先用：

```bash
git remote remove origin
git remote add origin https://github.com/<你的用户名>/meixilexue-page.git
```

## 6. 启用 GitHub Pages

1. 打开你的仓库页面。
2. 点击上方 `Settings`。
3. 左侧选择 `Pages`。
4. 在 `Source` 里选择：
   - Branch: `main`
   - Folder: `/root`（或 `/(root)`）
5. 点击 `Save`。
6. 等待页面刷新，GitHub 会显示你的站点地址，例如：

   `https://<你的用户名>.github.io/meixilexue-page/`

## 7. 更新内容并重新发布

每次你修改页面后，执行以下命令即可更新：

```bash
git add .
git commit -m "更新页面内容"
git push
```

GitHub Pages 会自动重新发布。

## 8. 修改风格和图片

你可以直接编辑下面这些文件：

- `index.html`：页面结构和文字内容
- `styles.css`：整体风格、配色、布局
- `articles.js`：文章列表、封面图、链接
- 本地图片：也可以把图片放到项目目录，然后在 `articles.js` 中使用相对路径，例如 `cover: "./images/cover1.jpg"`

## 9. 自定义域名（可选）

如果你以后想用自己的域名，比如 `meixilexue.com`：

1. 在仓库 `Settings` → `Pages` 中找到 `Custom domain`。
2. 输入你的域名并保存。
3. 在域名注册商处添加 CNAME 记录，指向：
   - `username.github.io`
4. 如果你使用子域名，例如 `www.meixilexue.com`，同样添加 `CNAME` 记录。

## 10. 常见问题

- **页面未立即生效？**
  等几分钟，GitHub Pages 会自动部署。
- **想预览本地效果？**
  直接在浏览器打开 `index.html`。
- **想使用中文域名或自己域名？**
  先购买域名，再在 GitHub Pages 中配置自定义域名。

---

如果你愿意，我也可以继续帮你生成一个 `deploy.sh` 脚本，方便一键发布。