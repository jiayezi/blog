# 个人博客

这是一个基于 [Hugo](https://gohugo.io/) 的个人博客项目。使用[pagefind](https://pagefind.app/)实现站内搜索。

## 🚀 快速开始

### 1. 安装 Hugo

请参考 [Hugo 官方安装指南](https://gohugo.io/getting-started/installing/)。

### 2. 克隆项目及主题

```bash
git clone <repository-url> --recursive
cd blog
```

### 3. 运行开发服务器

```bash
hugo server -D
```

然后在浏览器中打开 `http://localhost:1313` 即可查看博客。

## 📂 项目结构

```
.  # 博客根目录
├── archetypes/      # 内容模板
├── content/         # 博客文章和页面
│   ├── posts/       # 文章
│   └── pages/       # 页面
├── layouts/         # 页面布局
├── static/          # 静态文件（CSS、JS、图片等）
├── themes/          # 主题
├── hugo.toml      # 配置文件
└── README.md        # 项目说明
```

## 📝 创建新文章

```bash
hugo new content content/posts/my-first-post.md
```

然后编辑 `content/posts/my-first-post.md` 文件，添加内容。

## 🎨 主题

本项目使用 [PaperMod](https://github.com/adityatelange/hugo-PaperMod) 主题。

## 🛠️ 构建和部署

### 构建

```bash
hugo
```

这会在 `public/` 目录下生成静态网站文件。

### 部署

你可以将 `public/` 目录下的内容部署到任何静态网站托管平台，例如：
- GitHub Pages
- Netlify
- Vercel
- Cloudflare Pages
