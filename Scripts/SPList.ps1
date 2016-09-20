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
    $j = SPWeb $i;
    write-host $j
    $l = $j.lists | Where { $_.Title -eq $i.Title}
    return $l
}

function SPList() {

    $i = $args[0];
    


    if($w -ne $null){
        $l=GetSPList $i
        Write-Host $l.Title
    }

}

$testParams =@{
url = "http://win-fhhao4r7hve/sites/TS"
Title = "My Task"
}

SPList $testParams

