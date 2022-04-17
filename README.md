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
    1. 新建文件pages/home/tab_index/index.dart
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
        1. 新建文件widgets/common_swiper.dart
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

### 4.13、 首页-tabIndex-导航-准备

    【资源准备】
    1. 本地图片准备
        1. 将图片拷贝到static/images/目录
        2. 在pubspec.yaml中引入图片
    2. 数据准备

### 4.14、 首页-tabIndex-导航-实现

    【操作步骤】
    1. 添加文件pages/home/tab_index/index_navigator.dart
    2. 添加依赖material和index_navigator_item
    3. 编写无状态组件
    4. 完成页面结构
    5. 测试
    6. 调整细节

### 4.15、 组件CommonImage封装-分析

    【结论】
    使用flutter_advanced_networkimage_2 版本^2.0.1, 自己封装一个图片组件！

### 4.16、 组件CommonImage封装-实现

    【操作步骤】
    1. 准备
        1. 安装flutter_advanced_networkimage_2:^2.0.1依赖
        2. 添加文件/widgets/common_image.dart
        3. 引入依赖
        4. 编写正则根据图片地址判断是网络图片还是本地图片
    2. 编写框架代码
        1. 编写无状态组件
        2. 完善组件参数src with height fit
    3. 完成核心逻辑
        1. 如果是网络图片，使用flutter_advanced_networkimage_2
        2. 如果是本地图片，使用Image.asset
        3. 返回Container
    4. 使用CommonImage

### 4.17、 首页-tabIndex-推荐-准备

    【数据准备】
    1. 准备静态图片
    2. 准备数据代码

### 4.18、 首页-tabIndex-推荐-编码-主体结构部分

    【操作步骤】
    1. 准备
        1. 新建文件pages/home/tab_index/index_recommend_data.dart
        2. 使用上一节准备好的数据
        3. 新建文件pages/home/tab_index/index_recommend.dart
    2. 编写核心代码
        1. 添加依赖，dataList参数，无状态组件，indexRecommendData改成常量
        2. 添加背景色及边距
        3. 完善header部分
        4. 添加wrap
    3. 测试

### 4.19、 首页-tabIndex-推荐-编码-item部分

    【操作步骤】
    1. 新建文件pages/home/tab_index/index_recommend_item_widget.dart
    2. 添加依赖，无状态组件，data参数
    3. 编写主体结构
    4. 使用并测试
    5. 完善细节

### 4.20、 首页-tabIndex-资讯-准备

    【数据准备】
    1. 准备数据代码
    注意：
        1. 文字区域可能随屏幕宽度而改变
        2. title自动换行问题

### 4.21、 首页-tabIndex-资讯-编码-主体结构

    【操作步骤】
    1. 准备
        1. 添加文件pages/home/info/data.dart
        2. 添加上一节数据到data.dart
        3. 添加文件pages/home/info/index.dart
        4. 在index.dart添加material依赖
    2. 编写核心代码
        1. 完善title部分——注意title部分根据参数显示或隐藏
        2. 完善body部分
    3. 测试
    注意：
        1. Container alignment的使用
        2. 可以通过以下方式修改dart版本

### 4.22、 首页-tabIndex-资讯-编码-item部分

    【操作步骤】
    1. 创建文件pages/home/info/item_widget.dart
    2. 引入依赖，编写无状态组件，添加data参数
    3. 完成主体结构
    4. 测试代码
    5. 完善细节

### 4.23、 首页-tabInfo

    【操作步骤】
    1. 新建文件pages/home/tab_info/index.dart
    2. 添加material依赖，编写有状态组件
    3. 完善header部分
    4. 完善body部分
    5. 测试

### 4.24、 首页-tabSearch-分析

    【数据准备】
    1. 数据文件pages/home/tab_search/data_list.dart

### 4.25、 首页-tabSearch-主体结构

    【操作步骤】
    1. 创建文件pages/home/tab_search/data_list.dart使用上一节准备的数据
    2. 创建文件pages/home/tab_search/index.dart
    3. 引入依赖，创建有状态组件
    4. 编写主体结构
    5. 测试

### 4.26、 首页-tabSearch-item部分

    【操作步骤】
    1. 创建文件widgets/room_list_item_widget.dart
    2. 引入依赖，创建无状态组件，添加参数data
    3. 完成主体结构
    4. 添加测试
    5. 完善细节
    要点：
    文本...的问题

### 4.27、 首页-tabSearch-tag部分

    【操作步骤】
    1. 新建文件widgets/common_tag.dart
    2. 引入material依赖，添加无状态组件，添加参数title,color,backgroundColor
    3. 完成展示效果
    4. 测试
    5. 优化参数 使用factory工厂构造函数
    要点：
    圆角设置，factory使用

### 4.28、 组件-SearchBar-封装-分析

    【结论】
    1. 结构
    2. 参数
    3. 静态资源
        1. 资源地址static/icons/widget_search_bar_map.png
        2. 拷贝目标地址
        3. 在项目配置文件pubspec.yaml添加
            1. -static/icons/widget_search_bar_map.png

### 4.29、 组件SearchBar封装-主体结构开发

    【操作步骤】
    1. 创建文件widgets/search_bar/index.dart
    2. 引入material依赖，创建有状态组件，添加参数
    3. 编写界面代码
    4. 测试
    5. 完善代码
    要点：
    在有状态组件中使用参数(title)方式widget.title

### 4.30、 组件SearchBar封装-完善搜索框

    【操作步骤】
    1. 解决背景色，圆角——Container,TextField.InputDecoration.border=InputBorder.none
    2. 前置图标InputDecoration.prefixIcon
    3. 后置图标InputDecoration.suffixIcon
    4. 搜索提示样式InputDecoration.hintStyle
    5. 居中InputDecoration.contentPadding
    6. 间距问题 使用InputDecoration.Icon替代InputDecoration.prefixIcon

### 4.31、 组件SearchBar封装-细节完善

    【操作步骤】
    1. 使用参数defaultInputValue
    2. 使用参数inputValue
    3. 清除按钮逻辑实现
        1. 新增状态_searchWord
        2. 添加处理函数_onClean
        3. 添加并实例化_controller
        4. 根据_searchWord隐藏清除按钮
    4. 添加TextField.onTap
    5. 添加TextField.onSearchSubmit
    6. 添加TextField.textInputAction:TextInputAction.search
    7. 删除`||true`

### 4.32、 组件SearchBar封装-使用及优化

    【操作步骤】
    1. 在tabIndex使用
    2. 在tabSearch使用
    3. 在tabInfo使用
    4. 优化焦点问题
        1. 创建焦点对象FocusNode_focus,并实例化
        2. 在TextField使用焦点对象
        3. 在TextField onTap回调函数中通过_focus.unfocus()方法去焦点。

### 4.33、 首页-tabProfile-分析

    【数据准备】
    1. 网络图片
        1. 未登录图片"https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg"
        2. 已登录占位图片"https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg"
    2. 静态资源
        1. 资源地址static/images/home_profile_xxx.png
    3. 配置文件
    4. 列表数据

### 4.34、 首页-tabProfile-主体结构

    【操作步骤】
    1. 准备
        1. 添加文件pages/home/tab_profile/index.dart
        2. 添加material依赖，添加无状态组件
    2. 主体结构
        1. 使用Scaffold搭建主体结构
        2. 测试效果
    3. 完善
        1. 完善appBar部分
        2. 完善body部分

### 4.35、 首页-tabProfile-登录注册-未登录试图

    【操作步骤】
    1. 准备
        1. 添加文件pages/home/tab_profile/header.dart
        2. 添加material依赖，添加无状态组件
    2. 核心编码
        1. 添加背景色和高度
        2. 添加图片"https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg"
        3. 添加右侧文字
    3. 测试和完善
        1. 测试效果
        2. 完善细节

### 4.36、 首页-tabProfile-登录注册-已登录试图

    【操作步骤】
    1. 把内容显示部分抽提成函数
    2. 根据登录状态使用函数
    3. 修改已登录状态函数"https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg"
    4. 测试

### 4.37、 首页-tabProfile-功能按钮-主体结构

    【操作步骤】
    1. 准备
        1. 准备静态图片
        2. 准备数据文件pages/home/tab_profile/function_button_data.dart
    2. 核心编码
        1. 新建pages/home/tab_profile/function_button.dart
        2. 使用Wraper完成主体结构部分
        3. 使用Container替代item
    3. 测试

### 4.38、 首页-tabProfile-功能按钮-item

    【操作步骤】
    1. 新建文件pages/home/tab_profile/function_button_widget.dart
    2. 引入依赖，添加无状态组件，添加data参数
    3. 完成Item主体结构
    4. 测试
    5. 完善细节

### 4.39、 首页-tabProfile-广告及资讯

    【操作步骤】
    1. 创建文件pages/home/tab_profile/advertisement.dart
    2. 引入material依赖，添加无状态组件
    3. 完善主体结构'https://tva1.sinaimg.cn/large/006y8mN6ly1g6te62n8f4j30j603vgou.jpg'
    4. 测试
    5. 完善细节

### 4.40、 设置页

    【操作步骤】
    1. 准备
        1. 安装依赖fluttertoast:^3.1.3
        2. utils/common_toast.dart新建文件,封装CommonToast
        3. 新建文件pages/setting.dart,引入依赖，添加无状态组件
    2. 核心编码
        1. 完成页面主体结构
        2. 在路由系统注册当前页面
        3. 添加退出登录按钮
        4. 实现退出登录逻辑
    3. 测试

### 4.41、 房屋管理页-主体结构

    【操作步骤】
    1. 准备
        1. 添加文件pages/room_manage/index.dart
        2. 添加material依赖，创建无状态组件
    2. 核心编码
        1. 使用Scaffold添加页面主体结构
        2. 在路由系统注册当前页面
        3. 添加tab AppBar.bottom:TabBar()
        4. 添加body:TabBarView()
        5. 在Scaffold通过DefaultTabController关联Tabbar和TabBarView
    3. 测试

### 4.42、 发布房源页-发布按钮

    【操作步骤】
    1. 添加floatingActionButton属性
    2. 完善发布按钮主体结构GestureDetector>Container>Center>Text
    3. 修改floatingActionButtonLocation
    4. 完善细节
    5. 封装组件

### 4.43、 发布房源页-分析

    【结论】
    1. CommonTitle
    2. CommonFormItem
    3. CommonRadioFormItem
    4. CommonSelectFormItem
    5. CommonPicker
    6. CommonImagePicker
    7. CommonCheckButton
    8. RoomAppliance

### 4.44、 发布房源页-主体结构

    【操作步骤】
    1. 创建文件pages/room_add/index.dart
    2. 添加material依赖，添加有状态组件
    3. 使用Scaffold完成页面主体结构
    4. 添加提交按钮
    5. 在路由中注册该页面

### 4.45、 发布房源页-CommonTitle

    【操作步骤】
    1. 创建文件widgets/common_title.dart
    2. 添加material依赖，添加无状态组件，添加title参数
    3. 完成组件主体内容
    4. 使用组件
    5. 完善组件

### 4.47、 发布房源页-CommonFormItem-实现

    【操作步骤】
    1. 准备
        1. 创建文件widgets/common_form_item.dart
        2. 添加依赖，编写无状态组件，添加并初始化参数
        3. 使用组件
    2. 核心代码
        1. 主体结构 实现
        2. 底线 实现
        3. label 实现
        4. 文本框 实现
        5. 尾缀 实现
    3. 测试

### 4.48、 发布房源页-CommonFormItem-实现小区选择

    【操作步骤】
    1. 添加CommonFormItem
    2. 完善contentBuilder
    3. 完善点击事件处理
    4. 测试
    5. 优化CommonFormItem，调整Expanded位置

### 4.49、 发布房源页-CommonRadioFormItem

    【操作步骤】
    1. 准备
        1. 新建文件widgets/common_radio_form_item.dart
        2. 添加material依赖，添加无状态组件，添加并初始化参数
    2. 核心代码
        1. 使用CommonFormItem完成基本结构label和contentBuilder属性
        2. 在roomAdd页面使用CommonRadioFormItem
        3. 完善contentBuilder
        4. 处理选项及点击事件使用Radio
        5. 完善细节
    3. 测试
        1. 让按钮可点击

### 4.50、 发布房源页-CommonSelectFormItem

    【操作步骤】
    1. 准备
        1. 新建文件widgets/common_select_form_item.dart
        2. 添加material依赖，添加无状态组件，添加并初始化参数
    2. 核心代码
        1. 使用CommonFormItem完成基本结构
        2. 在roomAdd页面使用CommonSelectFormItem
        3. 完善细节
    3. 测试

### 4.51、 发布房源页-CommonPicker-分析

    【分析结论】
    1. CommonPicker.showPicker是一个class的静态方法
    2. 半屏弹窗——showCupertinoModalPopup
    3. 选择区域——CupertinoPicker

### 4.52、 发布房源页-CommonPicker-主体结构

    【操作步骤】
    1. 准备
        1. 新建文件utils/common_picker/index.dart
        2. 引入material和cupertino依赖
        3. 完善类及静态方法的主体结构
        4. 在CommonSelectFormItem中使用CommonPicker
    2. 核心编码
        1. 使用showCupertinoModalPopup返回Future
        2. 完善内容区header部分
        3. 使用CupertinoPicker完善内容区body部分
    3. 测试及完善
        1. 使用CommonPicker
        2. 完善细节

### 4.53、 发布房源页-CommonPicker-细节和事件

    【操作步骤】
    1. 细节
        1. 半屏高度
    2. 事件
        1. 在roomAdd页面添加状态
        2. 添加事件处理函数
        3. 完善CommonSelectFormItem的事件处理部分
        4. 完善CommonPicker的事件处理部分
    3. 测试

### 4.54、 发布房源页-房屋图像-主体结构

    【操作步骤】
    1. 准备
        1. 添加文件widgets/common_image_picker.dart
        2. 添加material依赖
        3. 准备测试图片数据
        4. 创建有状态组件
        5. 在roomAdd页面使用CommonImagePicker
    2. 核心编码
        1. 准备图片宽高
        2. 准备添加图片按钮
        3. 准备图片wrapper函数
        4. 展示图片及添加按钮
    3. 测试

### 4.55、 发布房源页-房屋图像-添加删除

    【操作步骤】
    1. 准备
        1. 安装image_picker依赖
        2. 引入image_picker依赖
    2. 核心代码
        1. 实现添加图片逻辑
            1. 添加状态files
            2. 图片数据使用files
            3. 添加方法pickImage
            4. addButton添加事件
            5. 测试
        2. 实现图片删除逻辑
            1. 添加删除图标
            2. 实现删除事件
            3. 测试

### 4.56、 发布房源页-房屋标题描述

    【操作步骤】
    1. 添加房屋标题
        1. 提示文案：请输入标题（例如：整租，小区名2室2000元）
    2. 添加房屋描述
        1. 提示文案：请输入房屋描述信息
    3. 添加controller
    4. 测试及细节完善
