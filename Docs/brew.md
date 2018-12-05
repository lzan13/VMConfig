brew 软件管理
==========

在经历过几次自己下载`node`安装包安装，卸载，重新安装之后，对如此麻烦的操作已经厌烦了，最终选择了`nvm`这个好用的工具，操作方便，可以管理`node`可以在任一版本间切换

### 安装
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### 常用命令
```
brew search <package_name>      # 搜索
brew install <package_name>     # 安装一个软件
brew update                     # 从服务器上拉取，并更新本地 brew 的包目录
brew upgrade <package_name>     # 更新软件
brew outdated                   # 查看你的软件中哪些有新版本可用
brew cleanup                    # 清理老版本。使用 `-n` 参数，不会真正执行，只是打印出真正运行时会做什么。
brew list --versions            # 查看你安装过的包列表（包括版本号）
brew link <package_name>        # 将软件的当前最新版本软链到`/usr/local`目录下
brew unlink <package_name>      # 将软件在`/usr/local`目录下的软链接删除。
brew info                       # 显示软件的信息 
brew deps                       # 显示包依赖
````