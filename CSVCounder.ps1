Get-ChildItem ".\CSV" -Filter *.csv | 
Foreach-Object {
    $FileName = $_.Name
    $Data = Import-Csv -Path ".\CSV\$FileName"
    # Amount of posts for 2017 and 2018
    $PostsIn2017 = 0
    $PostsIn2018 = 0
    ForEach($DataLine in $Data){
        If($DataLine.created_at -like "2018-*"){
            $PostsIn2018=$PostsIn2018+1
        }
        elseif ($DataLine.created_at -like "2017-*") {
            $PostsIn2017=$PostsIn2017+1
        }
        $Output = New-Object PSObject -Property @{
            Company = $FileName.Replace("_tweets.csv","")
            PostsIn2017 = $PostsIn2017
            PostsIn2018 = $PostsIn2018
            }
        }
    $Output |  Export-Csv -NoTypeInformation -Path ".\RESULTS\PostsPerYear.csv"
    # Amount of times B Corp for 2017 and 2018
    
    # Amount of times #BCorp for 2017 and 2018
    # Amount of @mentions for 2017 and 2018
    # Amount of hyperlinks for 2017 and 2018
    # Amount of keywords for 2017 and 2018 (governance, employees, community, economic impact, environment, customers and products)
}
