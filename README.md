# Flutter Mall (Flutter 商城应用)

一个基于 Flutter 构建的电商购物演示项目。

## ✨ 主要功能 (Features)

- **首页展示**：包含轮播图 (Carousel) 和商品分类导航。
- **商品列表**：展示模拟的商品数据，支持图片缓存。
- **购物车**：
  - 支持添加商品到购物车
  - 基于 `Provider` 的状态管理，实时响应购物车数量和总价变化
  - 基于 `Hive` 的本地持久化存储，应用重启后数据不丢失
- **商品详情**：查看商品详情信息。
- **个人中心**：用户相关的基础页面展示。

## 🛠️ 技术栈 (Tech Stack)

项目主要使用了以下核心库和技术：

- **[Flutter](https://flutter.dev/)** - 跨平台 UI 框架
- **[Provider](https://pub.dev/packages/provider)** - 应用状态管理 (购物车状态)
- **[Hive](https://pub.dev/packages/hive_flutter)** - 轻量级、高性能的本地 NoSQL 数据库 (购物车数据持久化)
- **[Go Router](https://pub.dev/packages/go_router)** - 声明式的页面路由管理
- **[Carousel Slider](https://pub.dev/packages/carousel_slider)** - 首页轮播图组件
- **[Cached Network Image](https://pub.dev/packages/cached_network_image)** - 网络图片加载与缓存

## 📁 目录结构 (Project Structure)

项目主要代码位于 `lib/` 目录下：

```text
lib/
├── models/         # 数据模型 (Product, CartItem)
├── pages/          # 页面视图 (HomePage, CartPage, ProductDetailPage, ProfilePage 等)
├── routes/         # 路由配置 (AppRouter)
├── services/       # 业务逻辑与服务层 (CartService, MockService)
└── main.dart       # 应用入口点与全局初始化
```

## 🚀 快速开始 (Getting Started)

### 环境要求

确保您的开发环境已经安装并配置好 Flutter SDK。

### 运行项目

1. 克隆或下载本项目到本地。
2. 在项目根目录下，运行以下命令获取依赖（参考 `package.json` 的脚本）：
   ```bash
   npm run pub
   ```
3. 启动应用（参考 `package.json` 的脚本；默认启动 Web/Chrome）：
   ```bash
   npm run start
   ```

4. 热重载：在编辑器中按 `Shift + R`。

---

_如果您是 Flutter 新手，可以参考 [官方文档](https://docs.flutter.dev/) 获取更多学习资源。_
