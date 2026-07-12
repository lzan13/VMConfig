# Download Oh-My-Posh themes from GitHub
# Save as pullOhMyPoshThemes.ps1 and run in PowerShell

$themeDir = "$env:USERPROFILE\.oh-my-posh\themes"
New-Item -ItemType Directory -Path $themeDir -Force | Out-Null

$zipUrl = "https://github.com/JanDeDobbeleer/oh-my-posh/archive/refs/heads/main.zip"
$zipPath = "$env:TEMP\oh-my-posh-main.zip"
$tempDir = "$env:TEMP\oh-my-posh-temp"

Write-Host "Downloading themes from GitHub..."
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing

Write-Host "Extracting..."
Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

Write-Host "Copying themes..."
Copy-Item -Path "$tempDir\oh-my-posh-main\themes\*" -Destination $themeDir -Recurse -Force

Remove-Item $zipPath -Force
Remove-Item $tempDir -Recurse -Force

$count = @(Get-ChildItem $themeDir -Filter '*.omp.json').Count
Write-Host "Done! $count themes downloaded to: $themeDir"
Write-Host ""
Write-Host "Example usage in your profile:"
Write-Host 'oh-my-posh init pwsh --config "$env:USERPROFILE\.oh-my-posh\themes\paradox.omp.json" | Invoke-Expression'
