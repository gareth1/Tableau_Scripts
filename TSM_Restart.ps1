<#

    FilePath should be changed to an appropriate file path for your use. The directory should be created and the current user

    needs access to write to the directory. Preferences are that this is an unshared file within the user directory structure.

    The directory must exist beforehand so please create any directory structure that you want to use. The .tableau

    directory is created the first time you run 'tsm login' so it's a good place to put the credentials once that

    directory is created.

#>

$FilePath = "c:\Users\BackupAdmin\tableau\cred.sec"

<#

Change Username appropriately, remembering to add the correct Domain and a \ to the username

#>

$Username = "WIN-Q1U16AMRDBS.local\administrator"

 

$encryptedCred = Get-Content $FilePath | ConvertTo-SecureString

$cred = New-Object System.management.Automation.PsCredential($Username, $encryptedCred)

<#

    At this point, you can substitute the following for the password in any tsm command

    $cred.GetNetworkCredential().Password

#>

$Pass = $cred.GetNetworkCredential().Password

tsm login -u "$Username" -p "$Pass"

$Pass = ""

tsm restart