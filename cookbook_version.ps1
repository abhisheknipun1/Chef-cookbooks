cls

$output = Get-ChildItem "C:\cookbooks\create-new-file\metadata.rb"  | % { select-string $_ -pattern '^version' }

# Give your path where metadata.rb file is present

$output = $output.ToString()
$output = $output.Split()
$output = $output[1]

$len = $output.Length -1

$cookbok_version = $output.Substring(1,$len-1)
Write-Host $cookbok_version
