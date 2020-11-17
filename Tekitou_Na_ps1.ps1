<#
.DESCRIPTION
  Encoding : SJIS
  改行コード : CRLF
#>

# --------------------
Get-LocalUser -Name NormalUser | Format-List # NormalUserユーザが存在すること
Get-LocalGroup -Name Users | Format-List # Usersグループが存在すること
Get-LocalGroupMember -Name Users | Format-List # -> NormalUserがいること
Get-Date
Get-WmiObject Win32_OperatingSystem # Windowsのバージョン確認
whoami

# --------------------
Write-Output "==="
Get-ExecutionPolicy

# --------------------
Write-Output "==="
New-Item -Path "C:\Users\Public\Downloads" -Itemtype File -Name "test.txt" -Force
"hello" >> "C:\Users\Public\Downloads\test.txt"
Get-ChildItem -Path "C:\Users\Public\Downloads"
Get-Content -Path "C:\Users\Public\Downloads\test.txt"

# --------------------
Read-Host "どうだった？" # ここでWindowを開けたままにする