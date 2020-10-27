$br = "`n"
Set-ExecutionPolicy Bypass -Force

### ServicePointManager ServicePointManager is a static class used to create, maintain, and delete instances of the ServicePoint class.
### Setting ServicePointManager to TLS 1.2

$br
Write-Host ("Executing ServicePoint Object to use TLS 1.2 .. ") -ForegroundColor Yellow -NoNewline
Write-Host (" Make sure to run as Administrator to execute this script") -ForegroundColor Red
Write-Host (".")
Write-Host ("..")
Write-Host ("...")
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

### Installing Az Module
$br
Write-Host ("Executing Installing Az Module. Please wait...") -ForegroundColor Yellow

if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name AzureRM -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
} else {
    Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force
}
Write-Host ("Loading Az Modules. Please wait...") -ForegroundColor Yellow
Write-Host ("Do not close..") -ForegroundColor Red
Get-Module -ListAvailable | Where-Object Name -Like "Az*"
$br
Write-Host ("Az Module installation completed ..") -ForegroundColor Green

## Script End