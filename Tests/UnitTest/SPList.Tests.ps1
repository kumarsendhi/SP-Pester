[CmdletBinding()]
param(
    [string] $SharePointCmdletModule = (Join-Path $PSScriptRoot "..\Stub\Microsoft.SP.PowerShell.psm1" -Resolve)
)

 $RepoRoot = (Resolve-Path $PSScriptRoot\..\..).Path
 $Global:CurrentSharePointStubModule = $SharePointCmdletModule
 $Global:CurrentSharePointStubLoadedModule = "Microsoft.SP.PowerShell"

       Remove-Module -Name "Microsoft.SharePoint.PowerShell" -Force -ErrorAction SilentlyContinue
 Import-Module $Global:CurrentSharePointStubModule -WarningAction SilentlyContinue


#$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$here = $RepoRoot+'\Scripts'
$fileName =(Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.ps1', ''
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"



Describe "SPList unit test" {


    Context 'SPWeb Unit Test'{
        $testParams =@{
            url = "http://win-fhhao4r7hve/sites/TS1"
            Title = "My Task"
        }
        Mock Get-SPWeb {return (@{
            Title="TS1"
        })}
        It "SPWeb Exists" {
        (SPWeb $testParams).Title | Should Be "TS1"   
    }
    }


     Context 'SPList Unit Test'{
         $testParams =@{
            url = "http://win-fhhao4r7hve/sites/TS1"
            Title = "My Task"
        }
        Mock Get-SPWeb {
        
        $MockPath = $RepoRoot+'\Tests\MockData\'+$fileName+'-Mock.xml'
        $data = Get-Content $MockPath
       
        return (
            $rssData= [System.Management.Automation.PSSerializer]::DeserializeAsList($data)
        )} -Verifiable
      
       It "SPList Exists" {
        $rssData=(SPWeb $testParams)
        (GetSPList $testParams).Title | Should Be "My Task"
        Assert-MockCalled Get-SPWeb -Exactly 1
        $true | Should Be $true
        Assert-VerifiableMocks
    }
    
    }

    
}


 