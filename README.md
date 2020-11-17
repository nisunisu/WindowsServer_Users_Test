# 検証環境
- AWS
- EC2
    - Windows Server 2019
    - t2.micro

# ユーザ設定
- Group : Users
- ユーザ単位でのリモートデスクトップ許可 : 許可

## ユーザ作成
```PowerShell
$username = "NormalUser"
$password = "password" # "password"部分は適宜変えてね
$secure = ConvertTo-SecureString -String $password -AsPlainText -Force
New-LocalUser -Name $username -Password $secure
Add-LocalGroupMember -Member $username -Group "Users"
Add-LocalGroupMember -Member $username -Group "Remote Desktop Users" # リモデ出来るようになる
```


# 検証実施前の確認
```PowerShell
Get-LocalUser -Name NormalUser | Format-List # NormalUserユーザが存在すること
Get-LocalGroup -Name Users | Format-List # Usersグループが存在すること
Get-LocalGroupMember -Name Users | Format-List # -> NormalUserがいること
Get-Date
Get-WmiObject Win32_OperatingSystem # Windowsのバージョン確認
whoami
```

# 標準ユーザで以下が出来る？（出来ない場合、Administratorくれ、となる）
- ping, nslookup, tracert -> 実行できる(Ping_Nslookup_Tracert.log)
- Cドライブ配下のファイル読めるか -> 一部例外（以下）あるが、基本読める(Check_ACL.log)
    - Usersだと権限がなくて見れない
        - C:\PerfLogs
        - C:\Windows\LiveKernelReports
        - C:\Windows\ModemLogs
        - C:\Windows\Prefetch
        - C:\Windows\ServiceState
        - C:\Windows\Temp
    - 他のフォルダと少し権限が違う（読めるがファイルの作成・削除はできない系）
        - C:\Windows\AppReadiness
        - C:\Windows\Registration
        - C:\Windows\TAPI
        - C:\Windows\Tasks
        - C:\Windows\tracing
- .ps1の実行 -> できる(Tekitou_Na_ps1.log)
- イベントビューア見れるか -> 一部例外（以下）があるが、基本読める(Get_WinEvent.log)
    - 権限がなくて読めないもの一覧
        - Microsoft-Windows-AppXDeploymentServer/Restricted
        - Microsoft-Windows-ASN1/Operational
        - Microsoft-Windows-CAPI2/Operational
        - Microsoft-Windows-Crypto-NCrypt/Operational
        - Microsoft-Windows-GroupPolicy/Operational
        - Microsoft-Windows-Help/Operational
        - Microsoft-Windows-Hyper-V-Hypervisor-Admin
        - Microsoft-Windows-Hyper-V-Hypervisor-Operational
        - Microsoft-Windows-LiveId/Operational
        - Microsoft-Windows-NetworkProvider/Operational
        - Microsoft-Windows-SmbClient/Audit
        - Microsoft-Windows-SmbClient/Connectivity
        - Microsoft-Windows-SMBClient/Operational
        - Microsoft-Windows-SmbClient/Security
        - Microsoft-Windows-SMBServer/Audit
        - Microsoft-Windows-SMBServer/Connectivity
        - Microsoft-Windows-SMBServer/Operational
        - Microsoft-Windows-SMBServer/Security
        - Microsoft-Windows-StateRepository/Restricted
        - Microsoft-Windows-UAC-FileVirtualization/Operational
        - Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurity
        - Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurityVerbose
        - Network Isolation Operational
        - Security
- 適当なインストーラの実行できるか
- サービスの起動停止
    - SQL Server


# 可能っぽいもの
- タスクスケジューラ
    - 基本タスクの作成
    - タスクの作成
    - タスクのインポート
- イベントビューア
    - Application
    - Security
    - Setup
    - システム
- アプリケーションとサービスログ

# できないもの
- ユーザとグループの作成・削除

# 盾マークが表示されていて操作できないもの
- デバイスマネージャの変更（確認は可能）
- リモートの設定
- システムの詳細設定