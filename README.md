# 好客租房 【Flutter 项目】

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 一、 项目框架

    3.1、初始化项目
    3.2、编写一个简单页面-准备
    3.3、编写一个简单页面-实现
    3.4、安装fluro并添加登录页面
    3.5、如何配置fluro
    3.6、配置fluro
    3.7、优化路由配置

## 二、 静态页面

    4.1、登录页面-页面分析
    4.2、登录页-主体结构
    4.3、登录页-密码显示隐藏
    4.4、登录页-细节优化
    4.5、注册页-添加
    4.6、注册页-完善
    4.7、首页-tab-分析
    4.8、首页-tab-编码
    4.9、首页-tabIndex-分析
    4.10、首页-tabIndex-轮播图
    4.11、封装CommonImage

### 3.1、 初始化项目

    【操作步骤】
    1. 打开vscode
    2. 初始化项目【菜单】——【查看】——【命令面板】——【Flutter：New Project】
    3. demo文件夹分析
    4. 打开模拟器【菜单】——【查看】——【命令面板】——【Flutter： Launch Emulator】
    5. 在ios模拟器上运行demo【菜单】——【运行】——【启动调试】
    6. 在Android模拟器上运行demo
    7. demo代码分析
        1. 引入flutter依赖
        2. 程序入口
        3. 无状态组件
        4. 有状态组件
    注意:
        1. 如果没有命令Flutter： New Project，则说明fluter安装有问题

### 3.3、 编写一个简单页面-实现

    【操作步骤】
    1. 添加PageContent组件
        1. 新建文件/widgets/page_content.dart
        2. 添加material依赖
        3. 编写无状态组件
        4. 添加name参数
        5. 使用Scaffold
    2. 添加home页面
        1. 新建文件/pages/home/index.dart
        2. 添加material, page_content依赖
        3. 编写无状态组件
        4. 使用PageContent
    3. 添加Application应用根组件
        1. 新建文件/application.dart
        2. 添加依赖
        3. 使用MaterialApp
    4. 测试

### 3.4、 安装fluro并添加登录页面

    1. 了解fluro
        1. 简单
        2. 支持参数通配符/room/:id
        3. 简化自定义动画
    2. 添加依赖
        dependencies:
            fluro: "^1.5.1"
    3. 添加/pages/login.dart
    4. 参考/pages/home/index.dart完善登录页

### 3.6、 配置fluro

    【操作步骤】
    1. 编写路由配置文件
        1. 创建routes.dart文件并编写Routes类的基本结构
        2. 定义路由名称
        3. 定义路由处理函数
        4. 编写函数configureRoutes关联路由名称和处理函数
    2. 在Application中配置路由
        1. 定义router
        2. 通过调用configureRoutes配置router
        3. 在MaterialApp中使用router
    3. 测试路由
        1. 在PageContent中添加跳转按钮

### 3.7、 优化路由配置

    【操作步骤】
    1. 错误页面处理
        1. 在/pages目录添加not_found.dart文件
        2. 实现NotFoundPage
        3. 在/routes.dart添加_notFoundHandler
        4. 在/routes.dart的configureRoutes中添加router.notFoundHandler=_notFoundHandler;
        5. 修改pageContent测试
    2. 带参数页面处理
        1. 在/pages目录添加room_detail/index.dart文件
        2. 实现RoomDetailPage
        3. 在/Routes.dart添加_roomDetailHandler
        4. 在/routes.dart的configureRoutes中添加router.roomDetailHandler=_roomDetailHandler;
        5. 修改PageContent测试

### 4.2、 登录页-主体结构

    【操作步骤】
    1. 添加Scaffold
    2. 完成appBar部分
    3. 完成body部分
        1. 用户名
        2. 密码
        3. 登录按钮
        4. 注册链接
    4. 主题颜色——theme
    5. 测试

### 4.3、 登录页-密码显示隐藏

    【操作步骤】
    1. 将无状态组件改成有状态组件——右键 重构
    2. 添加可点击的图标——iconButton
    3. 添加状态——showPassword
    4. 根据状态展示不同内容
    5. 给图标添加点击事件
    6. 测试

### 4.4、 登录页-细节优化

    【问题及解决方案】
    1. 【去注册】颜色问题 ——> 添加style
    2. 上下间距问题？ ——> 添加Padding
    3. 边距/异形屏幕问题？ ——> 使用SafeArea
    4. 垂直高度不足问题？ ——> 使用ListView替代Column
    5. 登录按钮宽度和颜色问题？ ——> 宽度：SizeBox或者父级固定宽度，颜色：手动设置

### 4.5、 注册页-添加

    【操作步骤】
    1. 添加文件/pages/register.dart
    2. 将login.dart文件拷贝到register.dart
    3. 修改类名称
    4. 修改title
    5. 在路由中添加register
        1. 添加route name
        2. 添加route handle
        3. 在configureRoutes中关联name和router
    6. 修改类组件类型，需要重启app后测试

### 4.6、 注册页-完善

    【操作步骤】
    1. 删除密码显示逻辑
    2. 添加确认密码
    3. 修改按钮及下方链接的文案
    4. 优化登录注册跳转，使用Navigator.pushReplacementNamed

### 4.7、 首页-tab-分析

    【结论】
    1. 首页共用tab按钮区域
    2. tab内容区的appBar不一样
    3. 4个tab内容区不一样
    4. 可以使用flutter自带组件BottomNavigationBar实现
        1. 需要准备4个tab内容区(tabView)
        2. 需要准备4个BottomNavigationBarItem

### 4.8、 首页-tab-编码

    【操作步骤】
    1. 将HomePage改成有状态组件
    2. 使用准备好的数据
    3. 使用官网demo代码
    4. 删除appBar
    5. 修改Scaffold.body
    6. 修改Scaffold.bottomNavigationBar

### 4.9、 首页-tabIndex-分析

    【结论】
    首页第一个tab（tabIndex）共5个区域, 对应5个不用的模块。
    1. 顶部区域--searchBar
    2. 轮播图区域--IndexSwipper
    3. 导航区域--IndexNavigator
    4. 房屋推荐区域--IndexRecommend
    5. 资讯区域--Info

### 4.10、 首页-tabIndex-页面结构

    【操作步骤】
    1. 新建文件/pages/home/tab_index/index.dart
    2. 添加依赖，编写无状态组件
    3. 简化实现顶部区域--appBar
    4. body部分包含多个组件且可以滚动——使用ListView
    5. 在HomePage中使用TabIndex

### 4.11、 首页-tabIndex-轮播图-准备

    【结论】
    使用flutter_swiper第三方组件实现轮播图功能

### 4.12、 首页-tabIndex-轮播图-实现

    【操作步骤】
    1. 准备组件框架代码
        1. 新建文件/widgets/common_swiper.dart
        2. 添加依赖material和flutter_swiper
        3. 准备图片数据
        4. 编写无状态组件
        5. 添加images参数并在构造函数中赋值
    2. 编写swiper核心代码
        1. 参照官网使用swiper
        2. 修改itemBuilder和itemCount
        3. Swiper父组件指定高度
        4. 删除Swiper.control
    3. 测试
        1. 在tabIndex中使用CommonSwiper
