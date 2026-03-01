<#
.SYNOPSIS
    Auto-detect mode launcher for AI Real Estate Assistant.
.DESCRIPTION
    Detects if Docker is available and runs in Docker mode, otherwise falls back to local mode.
    All arguments are passed through to the Python launcher.
.PARAMETER Args
    Arguments to pass to the launcher.
.EXAMPLE
    .\scripts\run.ps1
    .\scripts\run.ps1 --dry-run
    .\scripts\run.ps1 --service backend
#>
param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$Args
)

$ErrorActionPreference = "Stop"

# Help support
if ($Args -contains '--help' -or $Args -contains '-h' -or $Args -contains '-?') {
    @”
Usage: run.ps1 [options]

Auto-detect mode launcher for AI Real Estate Assistant.
Detects Docker availability and runs in appropriate mode.

Options:
  --help, -h, -?    Show this help message
  --dry-run         Show commands without executing
  --no-bootstrap    Skip dependency installation
  --mode            auto | docker | local (default: auto)
  --service         all | backend | frontend (default: all)
  --backend-port    Backend port (default: 8000)
  --frontend-port   Frontend port (default: 3000)

Examples:
  .\scripts\run.ps1                        # Auto-detect mode
  .\scripts\run.ps1 --mode local           # Force local mode
  .\scripts\run.ps1 --service backend      # Backend only
  .\scripts\run.ps1 --dry-run              # Show commands

For full options, run: python scripts/start.py --help
“@
    exit 0
}

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $root

. (Join-Path $root "scripts\shared\resolve_python.ps1")

$invocation = Get-PythonInvocation -ProjectRoot $root
& $invocation.Python @($invocation.Args) (Join-Path $root "scripts\start.py") @Args
exit $LASTEXITCODE
