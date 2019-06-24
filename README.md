安装
maven 方式
将下边的依赖条件放到你项目的 maven pom.xml 文件里。v3.3.10 为例，最新版本请看Release页面

<dependency>
    <groupId>cn.jpush.api</groupId>
    <artifactId>jpush-client</artifactId>
    <version>3.3.10</version>
</dependency>
jar 包方式
请到 Release页面下载相应版本的发布包。

依赖包
jiguang-java-client-common / 极光 Java client 的公共封装开发包，必须依赖，v1.1.4 为例，查看最新版本
slf4j / log4j (Logger)
gson (Google JSON Utils)
其中 slf4j 可以与 logback, log4j, commons-logging 等日志框架一起工作，可根据你的需要配置使用。

如果使用 Maven 构建项目，则需要在你的项目 pom.xml 里增加：

    <dependency>
        <groupId>cn.jpush.api</groupId>
        <artifactId>jiguang-common</artifactId>
        <version>1.1.4</version>
    </dependency>
    <dependency>
        <groupId>io.netty</groupId>
        <artifactId>netty-all</artifactId>
        <version>4.1.6.Final</version>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>com.google.code.gson</groupId>
        <artifactId>gson</artifactId>
        <version>2.3</version>
    </dependency>
    <dependency>
        <groupId>org.slf4j</groupId>
        <artifactId>slf4j-api</artifactId>
        <version>1.7.7</version>
    </dependency>

    <!-- For log4j -->
    <dependency>
        <groupId>org.slf4j</groupId>
        <artifactId>slf4j-log4j12</artifactId>
        <version>1.7.7</version>
    </dependency>
    <dependency>
        <groupId>log4j</groupId>
        <artifactId>log4j</artifactId>
        <version>1.2.17</version>
    </dependency>
如果不使用 Maven 构建项目，则项目 libs/ 目录下有依赖的 jar 可复制到你的项目里去。

mvn test
使用样例
如果使用 NettyHttpClient(v3.2.15 版本新增），需要在响应返回后手动调用一下 NettyHttpClient 中的 close 方法，否则进程不会退出。代码示例：

...
try {
    PushResult result = jpushClient.sendPush(payload);
    LOG.info("Got result - " + result);
    Thread.sleep(5000);
    // 请求结束后，调用 NettyHttpClient 中的 close 方法，否则进程不会退出。
    jpushClient.close();
} catch(InterruptedException e) {
    e.printStackTrace();
}
3.2.17 版本后，在 PushClient 中添加了 setHttpClient(IHttpClient client) 方法，用户可以自由切换 ApacheHttpClient，NettyHttpClient 或是 NativeHttpClient。

推送样例
以下片断来自项目代码里的文件：example / cn.jpush.api.examples.PushExample

    JPushClient jpushClient = new JPushClient(MASTER_SECRET, APP_KEY, null, ClientConfig.getInstance());

    // For push, all you need do is to build PushPayload object.
    PushPayload payload = buildPushObject_all_all_alert();

    try {
        PushResult result = jpushClient.sendPush(payload);
        LOG.info("Got result - " + result);
	
    } catch (APIConnectionException e) {
        // Connection error, should retry later
        LOG.error("Connection error, should retry later", e);

    } catch (APIRequestException e) {
        // Should review the error, and fix the request
        LOG.error("Should review the error, and fix the request", e);
        LOG.info("HTTP Status: " + e.getStatus());
        LOG.info("Error Code: " + e.getErrorCode());
        LOG.info("Error Message: " + e.getErrorMessage());
    }
进行推送的关键在于构建一个 PushPayload 对象。
