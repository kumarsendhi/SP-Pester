function SPWebApp{
    $params = $args[0]

    $wa = Get-SPWebApplication -Identity $params.Name
    return $wa
   
}

 $testParams =@{
        Name='SharePoint - 80'
        }

        SPWebApp $testParams



