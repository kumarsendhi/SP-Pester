[CmdletBinding()]
param(
    [string] $SharePointCmdletModule = (Join-Path $PSScriptRoot "..\Stub\Microsoft.SP.PowerShell.psm1" -Resolve)
)

 $RepoRoot = (Resolve-Path $PSScriptRoot\..\..).Path
    $Global:CurrentSharePointStubModule = $SharePointCmdletModule
    
    Remove-Module -Name "Microsoft.SharePoint.PowerShell" -Force -ErrorAction SilentlyContinue
    Import-Module $Global:CurrentSharePointStubModule -WarningAction SilentlyContinue

#$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$here = $RepoRoot+'\Scripts'
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "SPSite Unit test" {
    $testParams = @{
        Id='5ee9389b-63c5-468d-99cc-edf4e9ce9b24'
        Name='WSS_Content_101'
        WebApplication='SPWebApplication Name=Social - 101'
        Server='WIN-FHHAO4R7HVE'
        CurrentSiteCount=3
    }
    Context "Verify SPSite exists in Content Database"{
    Mock Get-SPSite {return(@{Count = 5})}
    It "SPSite Count is greater than 0 in Content Database" {    
        (SPSite $testParams).Count | Should BeGreaterThan 0
    }
    }
    Context "Verify SPSite doesn't exists in Content Database"{
    Mock Get-SPSite {return $null}
    It "SPSite Count is greater than 0 in Content Database" {    
        (SPSite $testParams).Count | Should Be 0
    }
    }
}
