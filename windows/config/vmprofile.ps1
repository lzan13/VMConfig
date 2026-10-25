# PowerShell profile
# echo $PROFILE 获取配置文件路径，然后将一下内容粘贴进去
##################################################################

# 本机只保留「配置仓库根路径」；具体别名 / MSVC 等放在 VMConfig 里跨设备同步。
# 其他机器：改这一行（或设用户环境变量 VMCONFIG）后复用同一套脚本即可。
if (-not $env:VMCONFIG) {
    $env:VMCONFIG = 'C:\Develop\Workspace\Other\VMConfig'
}

# 1. 常用别名
. "$env:VMCONFIG\windows\config\vmalias.ps1"

# 2. MSVC（VsDevShell）— 桌面 CMake / JNI
. "$env:VMCONFIG\windows\config\vmmsvc.ps1"

# 3. Oh-My-Posh 主题
oh-my-posh init pwsh --config "$env:USERPROFILE\.oh-my-posh\themes\robbyrussell.omp.json" | Invoke-Expression
