<#

FilePath should be changed to an appropriate file path for your use. The directory should be created and the current user

needs access to write to the directory. Preferences are that this is an unshared file within the user directory structure.

The directory must exist beforehand so please create any directory structure that you want to use.

#>

$FilePath = "c:\Users\BackupAdmin\tableau\cred.sec"

$Credential = Get-Credential

$Credential.Password | ConvertFrom-SecureString | Set-Content $FilePath