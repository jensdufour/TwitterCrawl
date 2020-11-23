$Output=@() 
$Output2=@() 
$Output3=@() 
$Output4=@() 
$Output5=@() 
$Output6=@() 
Get-ChildItem ".\CSV" -Filter *.csv | 
Foreach-Object {
    $FileName = $_.Name
    $Data = Import-Csv -Path ".\CSV\$FileName"
    # Amount of posts for 2017 and 2018
    $PostsIn2017 = 0
    $PostsIn2018 = 0
    ForEach($DataLine in $Data){
        If($DataLine.created_at -like "2018-*"){
            $PostsIn2018++
        }
        elseif ($DataLine.created_at -like "2017-*") {
            $PostsIn2017++
        }
    }
    $Output += New-Object PSObject -Property @{
        Company = $FileName.Replace("_tweets.csv","")
        PostsIn2017 = $PostsIn2017
        PostsIn2018 = $PostsIn2018
        }
    $Output |  Export-Csv -NoTypeInformation -Path ".\RESULTS\PostsPerYear.csv"
    # Amount of times B Corp for 2017 and 2018
    $bCorpIn2017 = 0
    $bCorpIn2018 = 0
    ForEach($DataLine in $Data){
        If($DataLine.created_at -like "2018-*"){
            If($DataLine.text -like "*b corp*"){
                $bCorpIn2017++
            }
        }
        elseif ($DataLine.created_at -like "2017-*") {
            If($DataLine.text -like "*b corp*"){
                $bCorpIn2018++
            }        
        }
    }
    $Output2 += New-Object PSObject -Property @{
        Company = $FileName.Replace("_tweets.csv","")
        bCorpIn2017 = $bCorpIn2017
        bCorpIn2018 = $bCorpIn2018
        }
    $Output2 |  Export-Csv -NoTypeInformation -Path ".\RESULTS\bCorpPerYear.csv"
    # Amount of times #BCorp for 2017 and 2018
    $HashTagbCorpIn2017 = 0
    $HashTagbCorpIn2018 = 0
    ForEach($DataLine in $Data){
        If($DataLine.created_at -like "2018-*"){
            If($DataLine.text -like "*#bcorp*"){
                $HashTagbCorpIn2017++
            }
        }
        elseif ($DataLine.created_at -like "2017-*") {
            If($DataLine.text -like "*#bcorp*"){
                $HashTagbCorpIn2018++
            }        
        }
    }
    $Output3 += New-Object PSObject -Property @{
        Company = $FileName.Replace("_tweets.csv","")
        HashTagbCorpIn2017 = $HashTagbCorpIn2017
        HashTagbCorpIn2018 = $HashTagbCorpIn2018
        }
    $Output3 |  Export-Csv -NoTypeInformation -Path ".\RESULTS\HashTagbCorpPerYear.csv"
    # Amount of @mentions for 2017 and 2018
    $MentionsIn2017 = 0
    $MentionsIn2018 = 0
    ForEach($DataLine in $Data){
        If($DataLine.created_at -like "2018-*"){
            If($DataLine.text -like "*@*"){
                $MentionsIn2017++
            }
        }
        elseif ($DataLine.created_at -like "2017-*") {
            If($DataLine.text -like "*@*"){
                $MentionsIn2018++
            }        
        }
    }
    $Output4 += New-Object PSObject -Property @{
        Company = $FileName.Replace("_tweets.csv","")
        MentionsIn2017 = $MentionsIn2017
        MentionsIn2018 = $MentionsIn2018
        }
    $Output4 |  Export-Csv -NoTypeInformation -Path ".\RESULTS\MentionsPerYear.csv"
    # Amount of hyperlinks for 2017 and 2018
    $LinksIn2017 = 0
    $LinksIn2018 = 0
    ForEach($DataLine in $Data){
        If($DataLine.created_at -like "2018-*"){
            If($DataLine.text -like "*https://*"){
                $LinksIn2017++
            }
        }
        elseif ($DataLine.created_at -like "2017-*") {
            If($DataLine.text -like "*https://*"){
                $LinksIn2018++
            }        
        }
    }
    $Output5 += New-Object PSObject -Property @{
        Company = $FileName.Replace("_tweets.csv","")
        LinksIn2017 = $LinksIn2017
        LinksIn2018 = $LinksIn2018
        }
    $Output5 |  Export-Csv -NoTypeInformation -Path ".\RESULTS\LinksPerYear.csv"
    # Amount of keywords for 2017 and 2018 (governance, employees, community, economic impact, environment, customers and products)
    $GovernanceIn2017 = 0
    $EmployeesIn2017 = 0
    $CommunityIn2017 = 0
    $EconomicImpactIn2017 = 0
    $EnvirnomentIn2017 = 0
    $CustomersIn2017 = 0
    $ProductsIn2017 = 0
    $GovernanceIn2018 = 0
    $EmployeesIn2018 = 0
    $CommunityIn2018 = 0
    $EconomicImpactIn2018 = 0
    $EnvirnomentIn2018 = 0
    $CustomersIn2018 = 0
    $ProductsIn2018 = 0
    ForEach($DataLine in $Data){
        If($DataLine.created_at -like "2018-*"){
            If($DataLine.text -like "*governance*"){
                $GovernanceIn2017++
            }
            elseif ($DataLine.text -like "*employees*") {
                $EmployeesIn2017++
            }
            elseif ($DataLine.text -like "*community*") {
                $CommunityIn2017++
            }
            elseif ($DataLine.text -like "*economic impact*") {
                $EconomicImpactIn2017++
            }
            elseif ($DataLine.text -like "*environment*") {
                $EnvirnomentIn2017++
            }
            elseif ($DataLine.text -like "*customers*") {
                $CustomersIn2017++
            }
            elseif ($DataLine.text -like "*products*") {
                $ProductsIn2017++
            }
        }
        elseif ($DataLine.created_at -like "2017-*") {
            If($DataLine.text -like "*governance*"){
                $GovernanceIn2018++
            }
            elseif ($DataLine.text -like "*employees*") {
                $EmployeesIn2018++
            }
            elseif ($DataLine.text -like "*community*") {
                $CommunityIn2018++
            }
            elseif ($DataLine.text -like "*economic impact*") {
                $EconomicImpactIn2018++
            }
            elseif ($DataLine.text -like "*environment*") {
                $EnvirnomentIn2018++
            }
            elseif ($DataLine.text -like "*customers*") {
                $CustomersIn2018++
            }
            elseif ($DataLine.text -like "*products*") {
                $ProductsIn2018++
            }
        }
    }
    $Output6 += New-Object PSObject -Property @{
        Company = $FileName.Replace("_tweets.csv","")
        GovernanceIn2017 = $GovernanceIn2017 
        EmployeesIn2017 = $EmployeesIn2017 
        CommunityIn2017 = $CommunityIn2017 
        EconomicImpactIn2017 = $EconomicImpactIn2017
        EnvirnomentIn2017 = $EnvirnomentIn2017
        CustomersIn2017 = $CustomersIn2017 
        ProductsIn2017 =  $ProductsIn2017 
        GovernanceIn2018 = $GovernanceIn2018
        EmployeesIn2018 = $EmployeesIn2018 
        CommunityIn2018 = $CommunityIn2018 
        EconomicImpactIn2018 = $EconomicImpactIn2018 
        EnvirnomentIn2018 = $EnvirnomentIn2018 
        CustomersIn2018 = $CustomersIn2018 
        ProductsIn2018 = $ProductsIn2018 
        }
    $Output6 |  Export-Csv -NoTypeInformation -Path ".\RESULTS\KeywordsPerYear.csv"
}