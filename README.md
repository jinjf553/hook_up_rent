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
