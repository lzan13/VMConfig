node & npm
==========

有时在国内使用 npm 下载一些包比较慢，甚至卡死，我们可以通过配置淘宝镜像来使用，参考：https://npm.taobao.org

### 配置 cnpm
我这里是将它配置在了`vmalias.sh`配置文件里，这样可以直接同步到其他设备使用
```
# alias for cnpm 配置了之后就可以使用 cnpm 进行管理 npm 的包了，参考 https://npm.taobao.org/
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"
# 或者安装 cnpm 来下载
npm install cnpm -g --registry=https://registry.npm.taobao.org
```