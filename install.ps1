# hipmmcode installer for Windows — downloads the prebuilt binary.
#   irm https://raw.githubusercontent.com/HiPMMAI/hipmmcode/main/install.ps1 | iex
#
# Requires Windows 10+ (bundled `tar`) and PowerShell 5.1+.
$ErrorActionPreference = "Stop"

$repo = if ($env:HIPMMCODE_REPO) { $env:HIPMMCODE_REPO } else { "HiPMMAI/hipmmcode" }
# ~/.local/bin — same location the unix install.sh uses, so the install path
# is identical across macOS / Linux / Windows.
$installDir = if ($env:HIPMMCODE_INSTALL_DIR) { $env:HIPMMCODE_INSTALL_DIR } else { Join-Path $HOME ".local\bin" }

# Windows PowerShell 5.1 defaults to SystemDefault, which on older .NET may not
# negotiate TLS 1.2 — GitHub requires it. Force TLS 1.2 so the download works.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$label = "windows-x64"
$url = "https://github.com/$repo/releases/latest/download/hipmmcode-$label.tar.gz"
Write-Host "Downloading $url ..."

$tmp = Join-Path $env:TEMP ("hipmmcode-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tmp | Out-Null
try {
    $tarball = Join-Path $tmp "hipmmcode.tar.gz"
    Invoke-WebRequest -Uri $url -OutFile $tarball -UseBasicParsing
    # Windows 10+ ships bsdtar as `tar`; it reads .tar.gz natively.
    tar -xzf $tarball -C $tmp
    if ($LASTEXITCODE -ne 0) { throw "tar extraction failed" }

    New-Item -ItemType Directory -Force -Path $installDir | Out-Null
    $dest = Join-Path $installDir "hipmmcode.exe"
    try {
        Copy-Item -Force (Join-Path $tmp "hipmmcode.exe") $dest
    }
    catch {
        # The most common failure on Windows: the target hipmmcode.exe is still
        # running and holding a file lock, so the copy is denied. Give a clear,
        # actionable message instead of a cryptic access error.
        throw "Could not write $dest. If hipmmcode is currently running, close it (all terminals/tabs) and re-run the installer. Original error: $($_.Exception.Message)"
    }
}
finally {
    # Best-effort cleanup. Never let a cleanup failure mask the real error from
    # the try block (PS 5.1 can throw a non-suppressible error here on paths
    # with spaces), so swallow anything this throws.
    try { Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue } catch { }
}

$exe = Join-Path $installDir "hipmmcode.exe"
Write-Host "Installed: $exe"
& $exe --version

# Add the install dir to the USER PATH (persisted) if it isn't already there.
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
$userPathEntries = @($userPath -split ';' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
$installDirNormalized = $installDir.TrimEnd('\')
$hasInstallDir = $userPathEntries | Where-Object {
    $_.Trim().TrimEnd('\') -ieq $installDirNormalized
}
if (-not $hasInstallDir) {
    $updatedUserPath = if ([string]::IsNullOrWhiteSpace($userPath)) {
        $installDir
    } else {
        "$userPath;$installDir"
    }
    [Environment]::SetEnvironmentVariable("Path", $updatedUserPath, "User")
    Write-Host "Added $installDir to your user PATH."
}

# Refresh PATH in this PowerShell process too, so hipmmcode works immediately
# after `irm ... | iex` without requiring the user to open a new terminal.
$machinePath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
$refreshedUserPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
$pathParts = @($machinePath, $refreshedUserPath) | Where-Object {
    -not [string]::IsNullOrWhiteSpace($_)
}
$env:Path = $pathParts -join ';'
Write-Host "Refreshed PATH for this PowerShell session."

Write-Host "Get started:  hipmmcode model   (configure a channel)   then:  hipmmcode"
Write-Host "If this terminal still cannot find hipmmcode, open a new terminal or run:"
Write-Host '$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")'

# hipmmcode's full-screen UI targets a modern VT terminal. The legacy
# PowerShell 5.1 / conhost console lacks VT processing, glyph coverage, and
# alt-screen mouse scroll — colors, borders and the selection pointer render
# wrong there. Windows Terminal (preinstalled on Win11, free on Win10) fixes
# all of it. Nudge the user if they're on the legacy console.
if (-not $env:WT_SESSION) {
    Write-Host ""
    Write-Host "Tip: for the best experience, run hipmmcode in Windows Terminal" -ForegroundColor Yellow
    Write-Host "     (Start menu -> 'Terminal', or run 'wt'). The legacy console" -ForegroundColor Yellow
    Write-Host "     renders colors, borders and the cursor incorrectly." -ForegroundColor Yellow
}
