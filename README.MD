# 用于测试 Java语言的CI/CD流程

使用当下最流畅的SpringBoot框架完成，为了加快编译速度，只提供一个GET接口。

```aidl
GET /api/v1/
```
返回内容：
```aidl
Hello, I am index !,我运行在-----test-----环境
Hello, I am index !,我运行在-----dev-----环境
```
其中test、dev是在配置文件中定义的，当运行在不同的环境中，对应的配置文件生效。

我们看到启动命令是：
```aidl
java -jar springbootDemo.jar --spring.profiles.active=${DEPLOY_ENV}
```
参数--spring.profiles.active控制哪个配置文件生效，取自于环境变量。所以不同的环境返回的内容不同。