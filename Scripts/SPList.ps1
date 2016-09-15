<#
Get the SPWeb
#>
function SPWeb(){
     $i = $args[0];
    $w= Get-SPWeb -Identity $i.url -ErrorAction SilentlyContinue
    return $w
}

function GetSPList(){
    
    $i = $args[0];
    $j = $args[1];
    $l = $j.lists[$i.Title];
    return $l
}

function SPList() {

    $i = $args[0];
    $w = SPWeb $i

    if($w -ne $null){
        $l=GetSPList $i $w
        Write-Host $l.Title
    }

}

$testParams =@{
url = "http://win-fhhao4r7hve/sites/TS"
Title = "My Task"
}

SPList $testParams

