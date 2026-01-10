# FoodieConnect Merchant App

FoodieConnect Merchant App 是一个基于 Flutter 开发的商户端应用，用于管理餐厅、菜单、员工和查看统计数据。

## 功能特性

### 核心功能
- **餐厅管理**：查看和编辑餐厅信息
- **菜单管理**：创建、编辑和管理菜品分类及菜品
- **员工管理**：管理餐厅员工信息和状态
- **统计分析**：查看餐厅经营数据统计
- **安全认证**：商户登录和权限管理
- **多语言支持**：支持英文、简体中文和繁体中文

### 技术特性
- 状态管理：Provider
- 网络请求：Dio + http
- 本地存储：shared_preferences + flutter_secure_storage
- 国际化：slang + flutter_localizations
- 图片处理：cached_network_image + image_picker
- 主题支持：浅色/深色主题

## 项目架构

```
lib/
├── core/               # 核心配置和工具
│   ├── constants/      # 应用常量
│   ├── enums/          # 枚举类型
│   ├── extensions/     # 扩展方法
│   ├── theme/          # 主题配置
│   └── utils/          # 工具类
├── data/               # 数据层
│   ├── models/         # 数据模型
│   ├── services/       # API服务
│   └── storage/        # 本地存储
├── l10n/               # 国际化资源
├── presentation/       # 表示层
│   ├── providers/      # 状态管理
│   ├── screens/        # 页面组件
│   └── widgets/        # 通用组件
└── main.dart           # 应用入口
```

## 技术栈

| 技术/库 | 版本 | 用途 |
|---------|------|------|
| Flutter | ^3.9.0 | 跨平台框架 |
| provider | ^6.1.5+1 | 状态管理 |
| dio | ^5.9.0 | 网络请求 |
| shared_preferences | ^2.5.3 | 本地存储 |
| flutter_secure_storage | ^9.2.4 | 安全存储 |
| slang | ^4.11.0 | 国际化 |
| cached_network_image | ^3.4.1 | 网络图片缓存 |
| image_picker | ^1.2.1 | 图片选择 |
| logger | ^2.6.2 | 日志工具 |
| json_serializable | ^6.7.1 | JSON序列化 |

## 开始使用

### 环境要求
- Flutter SDK: ^3.9.0
- Dart SDK: ^3.0.0
- Android Studio / VS Code

### 安装步骤

1. 克隆项目
```bash
git clone <repository-url>
cd foodieconnect
```

2. 安装依赖
```bash
flutter pub get
```

3. 生成代码
```bash
flutter pub run build_runner build
```

4. 运行应用
```bash
# 调试模式
flutter run

# 发布模式 (Android)
flutter build apk --release
```

## 开发指南

### 代码规范
- 使用 `flutter_lints` 进行代码检查
- 遵循 Flutter 官方代码风格指南
- 分层架构设计，职责清晰

### 国际化
- 在 `l10n` 目录下添加翻译文件
- 支持英文、简体中文和繁体中文
- 使用 `slang` 生成翻译代码

### API 调用
- 使用 `ApiService` 进行网络请求
- 支持 GET, POST, PUT, DELETE 方法
- 支持文件上传
- 统一的错误处理机制

## 目录说明

### core
包含应用的核心配置和工具类，如常量、主题、工具方法等。

### data
数据层，包含数据模型、API服务和本地存储。

### presentation
表示层，包含UI组件、页面和状态管理。

### l10n
国际化资源，包含不同语言的翻译文件。

## 主要页面

| 页面 | 功能 | 路径 |
|------|------|------|
| 登录页面 | 商户登录 | `/lib/presentation/screens/auth/login_screen.dart` |
| 仪表盘 | 应用主界面 | `/lib/presentation/screens/dashboard/dashboard_screen.dart` |
| 餐厅信息 | 查看餐厅详情 | `/lib/presentation/screens/restaurant/restaurant_info_screen.dart` |
| 餐厅编辑 | 编辑餐厅信息 | `/lib/presentation/screens/restaurant/restaurant_edit_screen.dart` |
| 菜单列表 | 菜品管理 | `/lib/presentation/screens/menu/menu_list_screen.dart` |
| 菜品编辑 | 编辑菜品信息 | `/lib/presentation/screens/menu/menu_item_screen.dart` |
| 员工管理 | 员工信息管理 | `/lib/presentation/screens/staff/staff_list_screen.dart` |
| 统计概览 | 经营数据统计 | `/lib/presentation/screens/statistics/statistics_overview_screen.dart` |
| 设置 | 应用设置 | `/lib/presentation/screens/settings/settings_screen.dart` |

## 测试

运行单元测试：
```bash
flutter test
```

## 构建和发布

### Android
```bash
# 构建发布版APK
flutter build apk --release

# 构建App Bundle
flutter build appbundle --release
```
