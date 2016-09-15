function GenerateStub(){
    $SPMockGenerator = (Join-Path $PSScriptRoot ".\Stub\SPMockGenerator.psm1" -Resolve)
    Import-Module $SPMockGenerator -WarningAction SilentlyContinue
    $stubPath = $PSScriptRoot +'\Stub\Microsoft.SP.PowerShell.psm1'
    if(![System.IO.File]::Exists($stubPath)){
        Write-SharePointStubFiles $stubPath
    }
    else{
        Remove-Item $stubPath
        Write-SharePointStubFiles $stubPath
    }
    
}

GenerateStub 