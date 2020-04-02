# customer
项目搭建


### 项目框架搭建

#### 一、工具类：

##### 1.EventEmitter类：事件通知
    +emit 发送事件通知
    +addListener 监听事件通知
    -remove 移除通知监听器


##### 2.Toast类：模仿安卓3秒提示
    -show: 显示

##### 3.AlertUtil类：弹框封装，简化使用
    +alert 系统样式弹框

##### 4.WebService：网络接口请求封装 （建议导入NetworkHeader.h）
    -get:
    -post:
    
#### 二、文件放置：

##### 1.遵循MVVM模式
    1）ViewController作为中间人，不处理数据，非必要不显示视图细节，只是处理试图组件View和视图数据ViewModel之间的交互。
    2）所有的model模型类都放到main/models/文件夹下。
    3）所有ViewController都有对应的ViewModel，放入对应文件夹。
    4）ViewController请继承CUSViewController，ViewModel请继承CUSViewModel类。
    5）ViewController必须重写父类 - (void)bindViewModel;方法。
    
##### 2.其他
    1）接口path都写到path.h文件中。
    2）所有通知名NotificationName都写到Notification.h文件中。
    3）所有项目级别宏定义都写到Define.h文件中。
    4）所有项目级别配置写到Config.h文件中。
    5）所有自定义view都继承CUSBaseView。
