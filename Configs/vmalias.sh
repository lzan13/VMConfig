### 配置常用别名


##################################################################
### 配置 相关命令
##################################################################
### 系统命令
alias lls="ls -als"

### 编辑 .zshrc 配置文件
alias vzshrc="vim ~/.zshrc"
alias szshrc="source ~/.zshrc"

### open vscode
alias vcode="open -a /Application/Visual\ Studio\ Code.app $1"


##################################################################
### adb 相关命令
##################################################################
### adb devices
alias adbd="adb devices"
alias adbs="adb shell"
alias adblg="adb -s LGD8577eaf0ba"
alias adbmi="adb -s 601519cc"
alias adbmz="adb -s 810EBND57XTM"

### keytool 相关命令
alias kt4jks="keytool -list -v -keystore"
alias kt4rsa="keytool -printcert -file"


##################################################################
### git 相关命令
##################################################################
### git add
alias ga="git add"
alias gaa="git add ."

### git branch
alias gbh="git branch"
alias gbha="git branch -a"
alias gbhd="git branch -d"
alias gbhdf="git branch -D"
alias gbhr="git branch -r"

### git commit
alias gct="git commit"
alias gctm="git commit -m"

### git checkout
alias gck="git checkout"
alias gckb="git checkout -b"

### git clone
alias gce="git clone"
alias gceb="git clone -b"        
alias gdf="git diff"

### git log
alias glg="git log"
alias glgo="git log --oneline"
alias glgodg="git log --oneline --decorate --graph"
alias glgg="git log --graph"
alias glgs="git log --stat"

### git merge/rebase
alias gme="git merge"
alias gre="git rebase"

### git fetch/push/pull
alias gfh="git fetch"
alias gfho="git fetch origin"
alias gpl="git pull"
alias gplo="git pull origin"
alias gplod="git pull origin dev"
alias gplom="git pull origin master"
alias gph="git push"
alias gpho="git push origin"
alias gphod="git push origin dev"
alias gphom="git push origin master"

### git remote 
alias gre="git remote"
alias grev="git remote -v"
alias grea="git remote add"
alias grer="git remote remove"

### git reset
alias grt="git reset"
alias grthd="git reset --hard "

### git status
alias gss="git status"
alias gsss="git status -s"

### git stash
alias gsh="git stash"
alias gsha="git stash apply"
alias gshc="git stash clear"
alias gshd="git stash drop"
alias gshl="git stash list"
alias gshp="git stash pop"

### git tag
alias gtg="git tag"
alias gtgd="git tag -d"


##################################################################
### node npm 相关
##################################################################
### alias for cnpm 配置了之后就可以使用 cnpm 进行管理 npm 的包了，参考 https://npm.taobao.org/
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"