iTerm2&zsh
========
iTerm2 十一个非常强大的终端工具，自从用了之后，已经深深的爱上了他，现在彻底的把系统自带的终端给抛弃了 😂

### 安装
直接在官网 http://iterm2.com/ 下载并安装即可

### 设置为默认终端 
`Menu -> iTerm2 -> Make iTerm2 Default Term`

### 配色方案
这个根据个人喜好进行配置，我已经导出自己的配置放在`Docs`下

### zsh 的使用
zsh 的使用和 bash 区别不大，大部分功能都很简单而且自然，使用它主要是为了用`oh-my-zsh`

#### 安装 zsh
```bash
brew install zsh zsh-completions
```

#### 安装 oh-my-zsh：
可以通过[oh-my-zsh 项目主页](https://github.com/robbyrussell/oh-my-zsh) 参考安装`或`者直接运行  
```bash
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
```

#### 配置 .zshrc 文件
我这里直接将我自己的配置放在项目下，可以直接复制替换安装`oh-my-zsh`生成的`~/.zshrc`文件，或者自己对`.zshrc`进行配置
```
# 配置 zsh 主题
ZSH_THEME="agnoster"
...
# 配置启用插件
plugins=(
  brew 
  git 
  zsh-autosuggestions 
)
...
# 配置默认用户名
DEFAULT_USER="lz"
...
### 加载自定义别名配置
source ~/.VMConfig/vm_alias.sh
### 加载环境变量配置
source ~/.VMConfig/vm_env.sh
```

在使用`agnoster`主题的时候，如果想修改终端显示的用户名为自定义，需要同步修改主题文件，然后修改`.zshrc`配置文件中的`DEFAULT_USER`
```
# Context: user@hostname (who am I and where am I)
prompt_context() {
  # if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
  #   prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m"
  # fi
  if [ $DEFAULT_USER ]; then
    prompt_segment 6 black "%(!.%{%F{yellow}%}.)$DEFAULT_USER"
  fi
}
...
# Dir: current working directory
prompt_dir() {
  # prompt_segment blue $CURRENT_FG '%~'
  prompt_segment blue black '%C'
}
```

#### 配置自己的 alias.sh 文件：
```
### 配置常用别名
alias vizshrc="vim ~/.zshrc"
alias lls="ls -als"

### adb 相关命令
alias adbd="adb devices"
alias adbs="adb shell"
alias adblg="adb -s LGD8577eaf0ba"
alias adbmi="adb -s 601519cc"
alias adbmz="adb -s 810EBND57XTM"
```

#### 主题
个人非常喜欢`agnoster`这个主题，不过需要安装`Powerline-patched`字体，不过网上有好多推崇`ys`比较好，非常简单，这个大家可以自己感受下，只需要将上边配置主题的地方`agnoster`改为`ys`即可

- [Meslo font](https://github.com/powerline/fonts/tree/master/Meslo%20Dotted) 点击 view raw 来下载，为了方便我已经将此字体放入项目中
- [More powerline fonts](https://github.com/powerline/fonts/) @ powerline fonts

下载好后打开，然后点击`安装字体`之后按照`iTerm -> preferences -> profiles -> text`修改字体即可。


### 感谢
【[wild-flame](https://github.com/wild-flame) / [Mac OS X 配置指南](https://wild-flame.github.io/guides/)】