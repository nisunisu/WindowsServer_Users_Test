<#
.DESCRIPTION
  Encoding : SJIS
  ���s�R�[�h : CRLF
#>

# --------------------
Get-LocalUser -Name NormalUser | Format-List # NormalUser���[�U�����݂��邱��
Get-LocalGroup -Name Users | Format-List # Users�O���[�v�����݂��邱��
Get-LocalGroupMember -Name Users | Format-List # -> NormalUser�����邱��
Get-Date
Get-WmiObject Win32_OperatingSystem # Windows�̃o�[�W�����m�F
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
Read-Host "�ǂ��������H" # ������Window���J�����܂܂ɂ���