# ここを対象とする
$target_folders=@(
  "C:\PerfLogs"
  "C:\Program Files"
  "C:\Program Files (x86)"
  "C:\Windows"
)

# 権限調査。
$target_folders | Foreach-Object {
  # 対象フォルダ直下のフォルダ一覧を取得
  $folders = Get-ChildItem -Path "$_" | ? {$_.PsIsContainer -eq $true}
  $folders | Foreach-Object {
    $folder_path = $_.FullName
    $acl = Get-Acl -Path $folder_path
    $acl_obj = $acl.Access |
      Where-Object {
        $_.IdentityReference -match "Users" -and
        $_.FilesyStemRights  -match "Read"
      }
    # ユーザ名、権限、フォルダパスを表示
    Write-Output "$($acl_obj.IdentityReference) : $($acl_obj.FilesyStemRights) : $($_.FullName)"
  }
}
