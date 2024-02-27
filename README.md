# redis-stat 的 arm64v8 docker 镜像构建

## redis-stat 是什么

> https://github.com/junegunn/redis-stat

八年前就停止维护了

## redis-stat 的 docker 方式获取 for amd64

> 相比现在 Ruby 开发者已经不多了, 还要熟练解决 ruby 和 gem 问题, 就更少了, 通过 docker 启动是更好的选择.

> https://hub.docker.com/r/richardhull/redis-stat

然而这是 amd64 的架构..

如果需要在 arm64 的机器上运行..

就继续看..

## arm64 镜像的构建与运行

### 本地构建镜像
```shell
docker build -t redis-stat-arm64v8 --no-cache . 
```

### 启动 redis-stat 服务
> 只启用终端

```shell
docker run --rm -it --net=host  redis-stat-arm64v8
```

> 启用 Web Server

```shell
docker run --rm -it --net=host  redis-stat-arm64v8 --server
```

## 说明

- 主要处理了依赖降级问题, 一方面这个项目基于 Ruby2 , 在 Ruby3 下已经有问题了
- 一些依赖库, 也有不少兼容性的问题, 做了逐一检查的降级
- 切换了构建时的 gem 镜像, Taobao 的源没了, RubyChina 的源也寄了, 用了腾讯的..时代的眼泪啊..

## Todo

- 把镜像也推到 docker hub 上去, 但是今天我困了