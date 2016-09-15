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
        $lists=@()
        $i=New-Object System.Object
        $i | Add-Member -MemberType NoteProperty -Name "Title" -Value "My Task"
        $i | Add-Member -MemberType NoteProperty -Name "HasUniqueRoleAssignment" -Value $false
        $lists +=$i
        $i=New-Object System.Object
        $i | Add-Member -MemberType NoteProperty -Name "Title" -Value "appdata"
        $i | Add-Member -MemberType NoteProperty -Name "HasUniqueRoleAssignment" -Value $false
        $lists +=$i
        $i=New-Object System.Object
        $i | Add-Member -MemberType NoteProperty -Name "Title" -Value "wfpub"
        $i | Add-Member -MemberType NoteProperty -Name "HasUniqueRoleAssignment" -Value $false
        $lists +=$i
        return (@{
            Title="TS1"
            Lists=$lists
        })}
      
       It "SPList Exists" {
        (SPList $testParams).Title | Should Be "My Task"
    }
    }

    
}


 