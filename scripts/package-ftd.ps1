<#
.SYNOPSIS
    Package FTD (Foot-In-The-Door) deployment pack

.DESCRIPTION
    Creates ftd-pack.zip containing all deployment artifacts
#>

$ErrorActionPreference = "Stop"

Write-Host "📦 Packaging FTD Pack..." -ForegroundColor Cyan

# Create dist directory
$distDir = Join-Path $PSScriptRoot "..\dist"
$tempDir = Join-Path $distDir "temp-ftd-pack"

if (Test-Path $distDir) {
    Remove-Item $distDir -Recurse -Force
}
New-Item -ItemType Directory -Path $distDir | Out-Null
New-Item -ItemType Directory -Path $tempDir | Out-Null

# Copy artifacts
Write-Host "Copying artifacts..." -ForegroundColor Yellow

$missingComponents = @()

# Azure Functions
$azFuncPath = Join-Path $PSScriptRoot "..\apps\azfunc-provision"
if (Test-Path $azFuncPath) {
    Write-Host "  - Azure Functions app" -ForegroundColor Green
    Copy-Item -Path $azFuncPath `
      -Destination (Join-Path $tempDir "azfunc-provision") `
      -Recurse `
      -Exclude @("node_modules", "dist", ".env", "local.settings.json")
} else {
    Write-Host "  - Azure Functions app [MISSING]" -ForegroundColor Red
    $missingComponents += "Azure Functions (apps/azfunc-provision)"
}

# SharePoint scripts
$spPath = Join-Path $PSScriptRoot "..\infra\sharepoint"
if (Test-Path $spPath) {
    Write-Host "  - SharePoint provisioning" -ForegroundColor Green
    Copy-Item -Path $spPath `
      -Destination (Join-Path $tempDir "sharepoint") `
      -Recurse
} else {
    Write-Host "  - SharePoint provisioning [MISSING]" -ForegroundColor Red
    $missingComponents += "SharePoint scripts (infra/sharepoint)"
}

# Teams scripts
$teamsPath = Join-Path $PSScriptRoot "..\infra\teams"
if (Test-Path $teamsPath) {
    Write-Host "  - Teams template" -ForegroundColor Green
    Copy-Item -Path $teamsPath `
      -Destination (Join-Path $tempDir "teams") `
      -Recurse
} else {
    Write-Host "  - Teams template [MISSING]" -ForegroundColor Red
    $missingComponents += "Teams scripts (infra/teams)"
}

# Power Automate flow
$flowPath = Join-Path $PSScriptRoot "..\flows\newhire"
if (Test-Path $flowPath) {
    Write-Host "  - Power Automate flow" -ForegroundColor Green
    Copy-Item -Path $flowPath `
      -Destination (Join-Path $tempDir "flow") `
      -Recurse
} else {
    Write-Host "  - Power Automate flow [MISSING]" -ForegroundColor Red
    $missingComponents += "Power Automate flow (flows/newhire)"
}

# Documentation
$runbookPath = Join-Path $PSScriptRoot "..\docs\RUNBOOK.md"
$rollbackPath = Join-Path $PSScriptRoot "..\docs\ROLLBACK.md"
if ((Test-Path $runbookPath) -and (Test-Path $rollbackPath)) {
    Write-Host "  - Documentation" -ForegroundColor Green
    Copy-Item -Path $runbookPath -Destination (Join-Path $tempDir "RUNBOOK.md")
    Copy-Item -Path $rollbackPath -Destination (Join-Path $tempDir "ROLLBACK.md")
} else {
    Write-Host "  - Documentation [MISSING]" -ForegroundColor Red
    $missingComponents += "Documentation (docs/RUNBOOK.md, docs/ROLLBACK.md)"
}

# Templates
$templatesPath = Join-Path $PSScriptRoot "..\project-brief\automation"
if (Test-Path $templatesPath) {
    Write-Host "  - Templates" -ForegroundColor Green
    Copy-Item -Path $templatesPath `
      -Destination (Join-Path $tempDir "templates") `
      -Recurse
} else {
    Write-Host "  - Templates [MISSING]" -ForegroundColor Yellow
    Write-Host "    (Templates are optional for core functionality)" -ForegroundColor Yellow
}

# Create README
Write-Host "  - README"
$readmeContent = @"
# M365 New-Hire Onboarding Automation - FTD Pack

**48-Hour Deployment Package**

## Contents

- /azfunc-provision/ - Azure Functions app (TypeScript)
- /sharepoint/ - SharePoint list provisioning scripts
- /teams/ - Teams template application scripts
- /flow/ - Power Automate flow definition
- /templates/ - JSON templates (SharePoint schema, Teams template)
- RUNBOOK.md - Complete deployment guide
- ROLLBACK.md - Rollback procedures

## Quick Start

1. Read RUNBOOK.md for complete instructions
2. Deploy in order: Azure → SharePoint → Teams → Flow
3. Test with sandbox data before production
4. Monitor first 3-5 runs closely

## Requirements

- Microsoft 365 E3/E5
- Azure subscription
- PowerShell 7+
- Node.js 18+
- PnP.PowerShell module

## Support

Refer to RUNBOOK.md for troubleshooting and support contacts.

## Time Estimate

- Setup & deployment: 24-36 hours
- Testing & training: 12 hours
- Total: 36-48 hours

---

**Version:** 1.0
**Created:** $(Get-Date -Format "yyyy-MM-dd")
"@

$readmeContent | Out-File (Join-Path $tempDir "README.md") -Encoding UTF8

# Check if critical components are missing
if ($missingComponents.Count -gt 0) {
    Write-Host ""
    Write-Host "⚠️  WARNING: Missing components detected!" -ForegroundColor Red
    Write-Host ""
    Write-Host "The following components are required but not found:" -ForegroundColor Yellow
    foreach ($component in $missingComponents) {
        Write-Host "  - $component" -ForegroundColor Yellow
    }
    Write-Host ""
    Write-Host "To resolve this issue:" -ForegroundColor Cyan
    Write-Host "  1. Ensure all PRs (1-7) are merged into this branch" -ForegroundColor Cyan
    Write-Host "  2. Or run this script from a branch with all components" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Note: The FTD pack can still be created with available components," -ForegroundColor Yellow
    Write-Host "      but it will be incomplete and may not work properly." -ForegroundColor Yellow
    Write-Host ""

    # Ask user if they want to continue
    $continue = Read-Host "Continue creating partial pack? (y/N)"
    if ($continue -ne "y" -and $continue -ne "Y") {
        Write-Host "❌ Packaging cancelled." -ForegroundColor Red
        Remove-Item $distDir -Recurse -Force
        exit 1
    }
}

# Create ZIP
Write-Host ""
Write-Host "Creating archive..." -ForegroundColor Yellow
$zipPath = Join-Path $distDir "ftd-pack.zip"
Compress-Archive -Path (Join-Path $tempDir "*") -DestinationPath $zipPath -Force

# Cleanup
Remove-Item $tempDir -Recurse -Force

# Summary
$zipSize = (Get-Item $zipPath).Length / 1MB
Write-Host ""
Write-Host "✅ FTD Pack created successfully!" -ForegroundColor Green
Write-Host "📁 Location: $zipPath" -ForegroundColor Cyan
Write-Host "📊 Size: $([math]::Round($zipSize, 2)) MB" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next: Extract and follow RUNBOOK.md for deployment" -ForegroundColor Yellow
