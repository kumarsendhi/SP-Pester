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

Describe "SPWeb Unit test" {
    
    $testParams =@{
        url = "http://win-fhhao4r7hve/sites/AT"
    }
    Context 'SPWeb contains subsites'{
        Mock Get-SPWeb {
        $url=@()
       
        $i=New-Object System.Object
        $i | Add-Member -MemberType NoteProperty -Name "Url" -Value "http://win-fhhao4r7hve/sites/AT"
        $url +=$i
         $j=New-Object System.Object
        $j | Add-Member -MemberType NoteProperty -Name "Url" -Value "http://win-fhhao4r7hve/sites/AT/AT1"
        $url +=$j
        return (
            @{
            Title = "AT"
            IsRootWeb = $true
            Webs=$url
            }
        )}
        It "subsites exist" {
            (SPWeb $testParams).Webs.count | Should Be 2
        }
    }
    Context 'SPWeb doesnt contains subsites'{
               Mock Get-SPWeb {
        $url=@()
        <#
         $i=New-Object System.Object
        $i | Add-Member -MemberType NoteProperty -Name "Url" -Value "http://win-fhhao4r7hve/sites/AT"
        $url +=$i#>
        return (
            @{
            Title = "AT"
            IsRootWeb = $true
            Webs=$url
            }
        )}
        It "subsites doesnt exist" {
            (SPWeb $testParams).Webs.count | Should Be 0
        }
    }


}
