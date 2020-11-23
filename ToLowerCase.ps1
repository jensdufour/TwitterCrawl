Get-ChildItem ".\CSV" -Filter *.csv | 
Foreach-Object {
    $FileName = $_.Name
    (Get-Content .\CSV\$FileName -Raw).ToLower() | Out-File .\CSV\$FileName
}