function SPWeb {
    $w = Get-SPWeb -identity $testParams.url
    return $w
}

$testParams =@{
url = "http://win-fhhao4r7hve/sites/AT"
}


