function SPSite {
    $params = $args[0]

    $wa = Get-SPSite -ContentDatabase $params.Name
    return $wa
}

$testParams = @{
Id='5ee9389b-63c5-468d-99cc-edf4e9ce9b24'
Name='WSS_Content_101'
WebApplication='SPWebApplication Name=Social - 101'
Server='WIN-FHHAO4R7HVE'
CurrentSiteCount=3
}

SPSite $testParams
