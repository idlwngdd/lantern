# Lantern on Docker with socks proxy & Others


## 安装

change to direcotry containing Dockerfile or Dockerfile-CN
```
docker build -t lantern .
```

启动：
```
docker run -itd --restart=always --name lantern -p 3128:3128 -p 8080:8080 -p 23333 lantern
```

## 测试

浏览器打开：http://0.0.0.0:8080/[localHTTPTOKEN]
#### Obtain localHTTPTOKEN
```
docker exec -ti [cotainer ID] /bin/bash
cat settings.yaml
```
##### · 测试是否能上Google

`curl -kvx 127.0.0.1:3128 https://www.google.com/humans.txt`，能看到 **Google is built by a**... 就是成功了！

##### · 测试响应时间

`curl -kx 127.0.0.1:3128 -w %{time_namelookup}::%{time_connect}::%{time_starttransfer} https://www.google.com/humans.txt`

## 使用方法

##### · 配置

设置 -> 网络 -> 高级 -> 代理： *HTTP*、*HTTPS*填上`127.0.0.1:3128`; *SOCKS* `127.0.0.1:23333`

------

