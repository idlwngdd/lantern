## docker 运行 Lantern，科学上网

pull 失败请选择源码安装，已更换国内daocloud.io、阿里云源。

### 安装方法

    docker pull wilon/lantern
    docker run -itd --restart=always --name wilon-lantern -p 3128:3128 wilon/lantern

源码安装

    git clone https://github.com/wilon/lantern.git
    cd lantern
    docker build -t wilon/lantern .
    docker run -itd --restart=always --name wilon-lantern -p 3128:3128 wilon/lantern

### 使用方法

##### 测试

`curl -kvx 127.0.0.1:3128 http://www.google.com/humans.txt`，能看到 *Google is built by a*... 就是成功了！

##### MacOS 配置

设置 -> 网络 -> 高级 -> 代理： *HTTP*、*HTTPS*填上`127.0.0.1:3128`

##### WIN 配置

设置 -> 网络和Internet -> 代理 -> 手动设置代理： 填上`127.0.0.1:3128`

------
有问题？ [发issues](https://github.com/wilon/lantern/issues)
