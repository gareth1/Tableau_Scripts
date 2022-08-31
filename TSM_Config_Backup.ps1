$FilePath = "c:\Users\BackupAdmin\tableau\cred.sec"
$Username = "WIN-RAP9LR1CHAB.local\administrator"
$encryptedCred = Get-Content $FilePath | ConvertTo-SecureString
$cred = New-Object System.management.Automation.PsCredential($Username, $encryptedCred)
$Pass = $cred.GetNetworkCredential().Password

tsm login -u "$Username" -p "$Pass"

$Pass = ""

tsm settings export --output-config-file E:\Backups\ts_config.json
