# Oh-My-Posh 安装诊断脚本
# 在 PowerShell 中运行: .\find-oh-my-posh.ps1

Write-Host "========================================"
Write-Host "   Oh-My-Posh 安装诊断"
Write-Host "========================================"

# 1. 检查 PATH 中的 oh-my-posh 可执行文件
Write-Host ""
Write-Host "[1] 检查 oh-my-posh 是否在 PATH 中..."
$ompPath = Get-Command oh-my-posh -ErrorAction SilentlyContinue
if ($ompPath) {
    Write-Host "  找到: $($ompPath.Source)"
    Write-Host "  版本: $(oh-my-posh version 2>$null || oh-my-posh --version 2>$null)"
} else {
    Write-Host "  未找到！oh-my-posh 不在 PATH 中。"
}

# 2. 扫描常见安装目录
Write-Host ""
Write-Host "[2] 扫描常见安装目录..."
$commonPaths = @(
    "$env:LOCALAPPDATA\Programs\oh-my-posh"
    "$env:LOCALAPPDATA\Microsoft\WindowsApps\oh-my-posh.exe"
    "$env:USERPROFILE\scoop\apps\oh-my-posh"
    "$env:USERPROFILE\scoop\shims\oh-my-posh.exe"
    "$env:ProgramData\chocolatey\bin\oh-my-posh.exe"
    "$env:ProgramData\chocolatey\lib\oh-my-posh"
    "$env:USERPROFILE\.oh-my-posh"
    "C:\Program Files\oh-my-posh"
    "C:\Program Files (x86)\oh-my-posh"
)

$foundAny = $false
foreach ($p in $commonPaths) {
    if (Test-Path $p) {
        Write-Host "  [FOUND] $p"
        $foundAny = $true
    } else {
        Write-Host "  [MISS]  $p"
    }
}

if (-not $foundAny) {
    Write-Host ""
    Write-Host "  以上常见路径均未找到 oh-my-posh！"
}

# 3. 扫描主题文件
Write-Host ""
Write-Host "[3] 扫描主题文件 (.omp.json)..."
$themeRoots = @(
    "$env:LOCALAPPDATA\Programs\oh-my-posh\themes"
    "$env:USERPROFILE\scoop\apps\oh-my-posh\current\themes"
    "$env:ProgramData\chocolatey\lib\oh-my-posh\tools\themes"
    "$env:USERPROFILE\.oh-my-posh\themes"
)

$themesFound = $false
foreach ($tr in $themeRoots) {
    if (Test-Path $tr) {
        $count = (Get-ChildItem $tr -Filter "*.omp.json" -ErrorAction SilentlyContinue).Count
        Write-Host "  [FOUND $count themes] $tr"
        $themesFound = $true
    } else {
        Write-Host "  [MISS]  $tr"
    }
}

if (-not $themesFound) {
    Write-Host "  未找到任何主题目录！"
}

# 4. 环境变量检查
Write-Host ""
Write-Host "[4] 环境变量检查..."
if ($env:POSH_THEMES_PATH) {
    Write-Host "  POSH_THEMES_PATH = $env:POSH_THEMES_PATH"
} else {
    Write-Host "  POSH_THEMES_PATH 未设置"
}

# 5. 给出建议
Write-Host ""
Write-Host "========================================"
if (-not $ompPath) {
    Write-Host "  结论: oh-my-posh 未安装或不在 PATH 中"
    Write-Host "========================================"
    Write-Host ""
    Write-Host "  请按以下方式安装:"
    Write-Host ""
    Write-Host "  [推荐] 使用 winget 安装:"
    Write-Host '    winget install JanDeDobbeleer.OhMyPosh'
    Write-Host ""
    Write-Host "  安装完成后，请完全关闭并重新打开终端，"
    Write-Host "  然后再次运行此脚本确认。"
} else {
    Write-Host "  结论: oh-my-posh 已安装"
    Write-Host "========================================"
}
