cls
$output = Get-ChildItem "C:\cookbooks\create-new-file\metadata.rb"  | % { select-string $_ -pattern '^version' }
$output = $output.ToString()
$len = $output.Length
$len = $len - 1
$cookbok_version = $output.Substring(52,$len-52)
Write-Host $cookbok_version
