mvm 管理 node
==========

在经历过几次自己下载`node`安装包安装，卸载，重新安装之后，对如此麻烦的操作已经厌烦了，最终选择了`nvm`这个好用的工具，操作方便，可以管理`node`可以在任一版本间切换

### 安装 nvm
`nvm`开源地址 https://github.com/creationix/nvm
可以使用以下命令进行安装：
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# or
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

### 管理 node
`nvm`可以让`node`在你的电脑上多个版本共存，想用哪个版本就用哪个版本可以自由切换，