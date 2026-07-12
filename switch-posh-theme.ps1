# Oh-My-Posh 主题诊断与切换脚本
# 在 PowerShell 中运行: .\switch-posh-theme.ps1

Write-Host "========================================"
Write-Host "   Oh-My-Posh 主题工具"
Write-Host "========================================"

# 1. 检测版本
Write-Host ""
Write-Host "[1/4] 检测 Oh-My-Posh 版本..."
$version = oh-my-posh version 2>$null
if (-not $version) {
    $version = oh-my-posh --version 2>$null
}
Write-Host "版本: $version"

# 2. 查找主题目录
Write-Host ""
Write-Host "[2/4] 查找主题目录..."
$themePaths = @(
    "$env:POSH_THEMES_PATH"
    "$env:LOCALAPPDATA\Programs\oh-my-posh\themes"
    "$env:USERPROFILE\scoop\apps\oh-my-posh\current\themes"
    "$env:ProgramData\chocolatey\lib\oh-my-posh\tools\themes"
    "$env:USERPROFILE\.oh-my-posh\themes"
)

$foundPath = $null
foreach ($path in $themePaths) {
    if ($path -and (Test-Path $path)) {
        $foundPath = $path
        break
    }
}

if ($foundPath) {
    Write-Host "找到主题目录: $foundPath"
} else {
    Write-Host "未找到主题目录！"
    Write-Host "请确认 Oh-My-Posh 已安装，或手动指定路径。"
    return
}

# 3. 列出所有主题
Write-Host ""
Write-Host "[3/4] 可用主题列表:"
$themes = Get-ChildItem -Path $foundPath -Filter "*.omp.json" | Select-Object -ExpandProperty Name
if ($themes.Count -eq 0) {
    Write-Host "该目录下没有找到 .omp.json 主题文件。"
    return
}

$themeNames = $themes | ForEach-Object { $_ -replace '\.omp\.json$', '' }
for ($i = 0; $i -lt $themeNames.Count; $i++) {
    $num = $i + 1
    Write-Host "  [$num] $($themeNames[$i])"
}

# 4. 交互式选择
Write-Host ""
Write-Host "[4/4] 输入数字选择主题（或按回车跳过）:"
$choice = Read-Host

if ($choice -match '^\d+$') {
    $index = [int]$choice - 1
    if ($index -ge 0 -and $index -lt $themeNames.Count) {
        $selectedTheme = $themeNames[$index]
        $configPath = Join-Path $foundPath "$selectedTheme.omp.json"

        Write-Host ""
        Write-Host "已选择主题: $selectedTheme"
        Write-Host "配置文件: $configPath"

        # 临时应用预览
        Write-Host ""
        Write-Host "正在预览该主题..."
        oh-my-posh init pwsh --config "$configPath" | Invoke-Expression

        # 输出建议的 PROFILE 配置
        Write-Host ""
        Write-Host "========================================"
        Write-Host "  将以下行添加到你的 PROFILE 以永久生效:"
        Write-Host "========================================"
        Write-Host "oh-my-posh init pwsh --config `"$configPath`" | Invoke-Expression"
        Write-Host ""
        Write-Host "快速编辑命令: code `$PROFILE"
    } else {
        Write-Host "无效选择。"
    }
} else {
    Write-Host "已跳过，未切换主题。"
}
