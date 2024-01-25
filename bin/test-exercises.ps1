$tempFolderPath = [System.IO.Path]::GetTempPath() 

Write-Host $tempFolderPath


if (!(Test-Path -Path $tempFolderPath/"spec")) {
    New-Item -Path $tempFolderPath -Name "spec" -ItemType Directory
}
if (!(Test-Path -Path $tempFolderPath/"src")) {
    New-Item -Path $tempFolderPath -Name "src" -ItemType Directory
}
Write-Host crystal -v 
Write-Host $PWD

Function Test-Run() {
    Param(
        [string]$Name,
        [string]$Type
    )
    Write-Host "Testing $Name"
    Copy-Item -Path "$Name/.meta/src/$Type.cr" -Destination "$tempFolderPath/src/$Type.cr"
    $specFile = "$Name/$(jq -r '.files.test[0]' $Name/.meta/config.json)"
    Copy-Item -Path $specFile -Destination "$tempFolderPath/spec/spec.cr"
    (Get-Content -Path "$tempFolderPath/spec/spec.cr") -replace "pending", "it" | Set-Content -Path "$tempFolderPath/spec/spec.cr"
    Set-Location -Path "$tempFolderPath"
    crystal spec "./spec/spec.cr"
}

$currentLocation = Get-Location

foreach ($exercise in Get-ChildItem -Path ./exercises/practice/*) {
    Test-Run $exercise "example"
}

Set-Location -Path $currentLocation

foreach ($exercise in Get-ChildItem -Path ./exercises/concept/*) {
    Test-Run $exercise "exemplar"
}
