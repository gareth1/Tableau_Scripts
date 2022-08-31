$FilePath = "c:\Users\BackupAdmin\tableau\cred.sec"
$Username = "WIN-Q1U16AMRDBS.local\administrator"
$encryptedCred = Get-Content $FilePath | ConvertTo-SecureString
$cred = New-Object System.management.Automation.PsCredential($Username, $encryptedCred)
$Pass = $cred.GetNetworkCredential().Password

tsm login -u "$Username" -p "$Pass"

$Pass = ""

tsm maintenance backup --file ts_backup --append-date
