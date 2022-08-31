$User = ""
$File = "C:\Reports\Password.txt"
$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString)
$EmailTo = ""
$EmailFrom = ""
$Subject = "Tableau Daily Backup" 
$Body = "Good Morning / Afternoon, Please find attached the daily Tableau Server Backup Report."
$SMTPServer = "smtp.gmail.com" 
$AttachedFile = "F:\Output\Backup.txt"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($AttachedFile)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($cred.UserName, $cred.Password); 
$SMTPClient.Send($SMTPMessage)