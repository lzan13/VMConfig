##################################################################
### Windows MSVC / VsDevShell
### For desktop native builds (e.g. Intent-KMP LiveKit JNI / CMake).
### Dot-sourced from PowerShell profile. Do not hardcode MSVC version PATH.
##################################################################

function Initialize-VmMsvcEnv {
    if ($env:VM_MSVC_READY -eq '1') { return }

    # Already inside x64 Native / VsDevShell
    if ($env:VSCMD_ARG_TGT_ARCH -eq 'x64' -and (Get-Command cl -ErrorAction SilentlyContinue)) {
        $env:VM_MSVC_READY = '1'
        return
    }

    try {
        $vswhere = Join-Path ${env:ProgramFiles(x86)} 'Microsoft Visual Studio\Installer\vswhere.exe'
        if (-not (Test-Path -LiteralPath $vswhere)) {
            Write-Warning 'vswhere.exe not found. Install Visual Studio Build Tools (Desktop development with C++).'
            return
        }

        # IMPORTANT: quote '-products *' or PowerShell expands * as a filesystem glob.
        $vs = & $vswhere -latest -products '*' -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath |
            Select-Object -First 1

        if ([string]::IsNullOrWhiteSpace($vs)) {
            $vs = & $vswhere -latest -products '*' -property installationPath |
                Select-Object -First 1
        }

        $vs = if ($null -ne $vs) { "$vs".Trim() } else { '' }
        if ([string]::IsNullOrWhiteSpace($vs) -or -not (Test-Path -LiteralPath $vs)) {
            Write-Warning 'Visual Studio / Build Tools install not found. Skip MSVC env init.'
            return
        }

        $dll = Join-Path $vs 'Common7\Tools\Microsoft.VisualStudio.DevShell.dll'
        if (-not (Test-Path -LiteralPath $dll)) {
            Write-Warning "Microsoft.VisualStudio.DevShell.dll not found under: $vs"
            return
        }

        Import-Module -Name $dll
        Enter-VsDevShell -VsInstallPath $vs -SkipAutomaticLocation -DevCmdArguments '-arch=x64' | Out-Null
        $env:VM_MSVC_READY = '1'
    }
    catch {
        Write-Warning "Failed to load MSVC env: $($_.Exception.Message)"
    }
}

# Auto-init on profile load; call Initialize-VmMsvcEnv again if needed.
Initialize-VmMsvcEnv