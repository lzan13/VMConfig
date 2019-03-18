# !/bin/bash
# -------------------------------------
# 
#
# Author: lzan13
# WebSite: http://melove.net
# -------------------------------------

echo ""
cat ./Configs/vmloft
echo ""
echo "| 初始化个人配置:"
# 将配置文件夹链接到用户目录下
echo "| 1.将配置文件夹链接到用户目录下"
ln -s $(pwd) ~/.vmconfig
# 拷贝已经配置好的 zshrc 文件
echo "| 2.拷贝已经配置好的 zshrc 配置文件"
cp ~/.vmconfig/Configs/vmzshrc ~/.zshrc
# 重置 zshrc 配置，使最新的配置生效
exit