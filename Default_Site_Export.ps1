$FilePath = "c:\Users\BackupAdmin\tableau\cred.sec"
$Username = "WIN-Q1U16AMRDBS.local\administrator"
$encryptedCred = Get-Content $FilePath | ConvertTo-SecureString
$cred = New-Object System.management.Automation.PsCredential($Username, $encryptedCred)
$cred.GetNetworkCredential().Password
$Pass = $cred.GetNetworkCredential().Password

tsm login -u "$Username" -p "$Pass"
tsm sites export --site-id "" --file hootsuite_default_site e:\backups
