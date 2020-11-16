# 検証環境
- AWS
- EC2
    - Windows Server 2019
    - t2.micro

# ユーザ設定
- Name : NormalUser
- Password : kjkL3j89alKE（自分で作る）
- Group : Users
- ユーザ単位でのリモートデスクトップ許可 : 許可

# 確認手順
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
- Cドライブ配下のファイル読めるか -> 読めそう
    - C:\PerfLogs
- 適当なインストーラの実行できるか
- イベントビューア見れるか
- サービスの起動停止
    - SQL Server
- .ps1の実行
    - ExecutionPolicy


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
- 

