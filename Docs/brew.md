包管理工具让软件的安装（升级）和卸载都变得简便了许多。Homebrew 就是 Mac 下面的这样一个包管理工具（类似于 apt-get, yum)。

# **安装**

去官网查看最新安装方式 [https://brew.sh/](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

# 解决安装过慢

因为 brew 在国外，安装会非常慢，这里替换下清华源

## 安装脚本

首先浏览器复制上边的 [install.sh](http://install.sh) 地址去浏览器打开，保存文本内容到本地 vminstallbrew 文件

```bash
BREW_REPO="https://github.com/Homebrew/brew"
# 替换为
BREW_REPO="https://mirrors.ustc.edu.cn/brew.git"
# 运行此文件
/bin/bash vminstallbrew
```

## Clone homebrew-core

手动进入脚本 clone homebrew-core 目录

```bash
#参考 https://segmentfault.com/a/1190000021360086
# 如果没有homebrew，新建 homebrew 文件夹
mkdir homebrew

cd /usr/local/Homebrew/Library/Taps/homebrew

# 通过清华源进行clone
git clone git://mirrors.ustc.edu.cn/homebrew-core.git/ /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core --depth=1

# 更新下仓库源
cd $(brew --repo)
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

# 更新并检查
brew update
brew doctor
```

### **常用命令**

```bash
brew search <package_name> # 搜索
brew install <package_name> # 安装一个软件
brew update # 从服务器上拉取，并更新本地 brew 的包目录
brew upgrade <package_name> # 更新软件
brew outdated # 查看你的软件中哪些有新版本可用
brew cleanup # 清理老版本。使用 `-n` 参数，不会真正执行，只是打印出真正运行时会做什么。
brew list --versions # 查看你安装过的包列表（包括版本号）
brew link <package_name> # 将软件的当前最新版本软链到`/usr/local`目录下
brew unlink <package_name> # 将软件在`/usr/local`目录下的软链接删除。
brew info # 显示软件的信息
brew deps # 显示包依赖
```