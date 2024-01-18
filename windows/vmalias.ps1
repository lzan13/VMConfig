##################################################################
### Window 平台下配置文件
### echo $PROFILE
##################################################################


##################################################################
### 配置常用别名
##################################################################

##################################################################
### 配置 相关命令
##################################################################
### 系统命令
function lls {ls -als} 


# ##################################################################
# ### adb 相关命令
# ##################################################################
# ### adb devices
function adbd {adb devices}
function adbs {adb shell $args}
function adbrm10p {adb -s zxd65xfa7p4tamrk $args}
### scrcpy 投屏链接设备 -e 对应tcpip链接，-d 对应usb链接
function scrcpye {scrcpy -e -S -m 1080 --window-x=100 --window-y=100}
function scrcpyd {scrcpy -d -S -m 1080 --window-x=100 --window-y=100}

### cd 到工作目录
function cdw {cd D:\Develop\Workspace}

# ### keytool 相关命令
function kt4jks {keytool -list -v -keystore $args}
function kt4rsa {keytool -printcert -file $args}


##################################################################
### git 相关命令
##################################################################
### git add
function ga {git add $args}
function gaa {git add .}

### git branch
function gbh {git branch $args}
function gbha {git branch -a} 
function gbhd {git branch -d $args}
function gbhdf {git branch -D $args}
function gbhr {git branch -r $args}

### git commit
function gct {git commit $args}
function gctm {git commit -m $args}
function gctad {git commit --amend -m $args}

### git checkout
function gck {git checkout $args}
function gckb {git checkout -b $args}
function gckd {git checkout develop}
function gckm {git checkout main}

### git clone
function gce {git clone $args}
function gceb {git clone -b $args}        
function gdf {git diff $args}

### git log
function glg {git log}
function glgo {git log --oneline}
function glgodg {git log --oneline --decorate --graph}
function glgg {git log --graph}
function glgs {git log --stat}

### git merge/rebase
function gme {git merge $args}
function gmem {git merge main}
function gmed {git merge develop}
function gmeom {git merge origin/main}
function gmeod {git merge origin/develop}
function gre {git rebase $args}

### git fetch/push/pull
function gfh {git fetch $args}
function gfho {git fetch origin $args}
function gpl {git pull $args}
function gplo {git pull origin $args}
function gplod {git pull origin develop}
function gplom {git pull origin main}
function gph {git push $args}
function gpho {git push origin $args}
function gphod {git push origin develop}
function gphom {git push origin main}

### git remote 
function gre {git remote $args}
function grev {git remote -v}
function grea {git remote add $args}
function grer {git remote remove $args}

### git reset
function grt {git reset $args}
function grthd {git reset --hard $args}
function grtm {git reset --mixed $args}
function grts {git reset --soft $args}

### git status
function gss {git status}
function gsss {git status -s}

### git stash
function gsh {git stash $args}
function gsha {git stash apply $args}
function gshc {git stash clear}
function gshd {git stash drop $args}
function gshl {git stash list}
function gshp {git stash pop}

### git tag
function gtg {git tag $args}
function gtgd {git tag -d}

#################################################################
### python 相关命令
#################################################################
#alias python {/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9}
#alias python {/usr/bin/python3}


##################################################################
### svn 相关命令
##################################################################
function sct {svn checkout $args}
function ss {svn status}
function sdf {svn diff}
function sme {svn merge $args}
function sa {svn add $args}
function saa {svn add *}
function sct {svn commit $args}
function sctm {svn commit -m $args}
function sup {svn update $args}
function sdl {svn delete $args}



