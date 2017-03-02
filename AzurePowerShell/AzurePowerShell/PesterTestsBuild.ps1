param(
    [string]$SourceDir = $env:BUILD_SOURCESDIRECTORY,
    [string]$TempDir = $env:TEMP
)
$ErrorActionPreference = &quot;Stop&quot;
 
$modulePath = Join-Path $TempDir Pester-master\Pester.psm1
 
if (-not(Test-Path $modulePath)) {
 
    # Note: PSGet and chocolatey are not supported in hosted vsts build agent  
    $tempFile = Join-Path $TempDir pester.zip
    Invoke-WebRequest https://github.com/pester/Pester/archive/master.zip -OutFile $tempFile
 
    [System.Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem') | Out-Null
    [System.IO.Compression.ZipFile]::ExtractToDirectory($tempFile, $tempDir)
 
    Remove-Item $tempFile
}
 
Import-Module $modulePath -DisableNameChecking
 
$outputFile = Join-Path $SourceDir &quot;TEST-pester.xml&quot;
 
Invoke-Pester -Path $SourceDir -PassThru -OutputFile $outputFile -OutputFormat NUnitXml -EnableExit