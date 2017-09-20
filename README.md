## docker 运行 Lantern，科学上网

下载源为国内的daocloud.io、阿里云源，保证速度。

### 安装方法

```
git clone https://github.com/slugphp/lantern.git
cd lantern
docker build -t wilon/lantern .
docker run -itd --restart=always --name lantern -p 3128:3128 wilon/lantern
```

### 测试

浏览器打开：`http://0.0.0.0:8080/`

##### · 测试是否能上Google

`curl -kvx 127.0.0.1:3128 http://www.google.com/humans.txt`，能看到 **Google is built by a**... 就是成功了！

##### · 测试响应时间

`curl -kx 127.0.0.1:3128 -w %{time_namelookup}::%{time_connect}::%{time_starttransfer} https://www.google.com/humans.txt` 

### 使用方法

##### · MacOS 配置

设置 -> 网络 -> 高级 -> 代理： *HTTP*、*HTTPS*填上`127.0.0.1:3128`

##### · WIN 配置

设置 -> 网络和Internet -> 代理 -> 手动设置代理： 填上`127.0.0.1:3128`

------
有问题？ [发issues](https://github.com/wilon/lantern/issues)
