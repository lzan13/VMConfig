# !/bin/bash
# -------------------------------------
# 自定义 Shell 命令小工具，包含一些自己常用的命令，
# 可以根据输入的不同命令执行不同的操作
#
# Author: lzan13
# WebSite: http://melove.net
# -------------------------------------

echo ""
cat ./vmloft
echo ""
echo ""
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "┃ 自定义 Shell 命令小工具, 省去记录各种命令的烦恼, 使用方式:"
echo "┃ 直接输入对应命令前的字母, 如果命令需要二次确认, 只需在命令后紧跟确认码 (1 or 0) 即可, 记得回车"
echo "┃ 例入要显示隐藏文件只需要输入:"
echo "┃ a 1"
echo "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "┣━ a.显示隐藏文件 1-YES, 0-NO"
echo "┣━ b.允许任何来源 1-YES, 0-NO; 允许任何来源，解决三方汉化和破击软件无法安装问题"
echo "┣━ "
echo "┣━ "
echo "┣━ "
echo "┣━ q.退出命令"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
# 根据输入执行响应的操作
control(){
    # 等待键盘输入,执行对应的命令,
    read -p "━━ 输入要执行的命令: " input code
    if [ ! -n "$code" ]; then
        code=1
    fi
    case $input in
        a)
        showAllFile $code;;
        b)
        showAnySource $code;;
        q)
        exit 0;;
        *)
        showError;;
    esac
}

# 输出信息
echoMsg(){
    msg=$1
    echo "━━ $msg"
}

# 显示错误提示
showError(){
    echoMsg "无法识别对应命令 ( ┭┮﹏┭┮ )"
    # 出错之后等待命令输入
    control
}

# 显示隐藏文件
showAllFile(){
    if [ $1 != 0 ];then
        defaults write com.apple.finder AppleShowAllFiles YES;
    else
        defaults write com.apple.finder AppleShowAllFiles NO;
    fi
    killall Finder;
}

# 允许任何来源，解决三方汉化和破击软件无法安装问题
showAnySource(){
    if [ $1=1 ]; then
        sudo spctl --master-disable
    else
        sudo spctl --master-enable
    fi
}

# 等待命令输入
control