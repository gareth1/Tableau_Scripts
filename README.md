# Tableau_Scripts
PowerShell Scripts I leverage in a production Tableau Server Enviornment

Auto_Delete_Local.ps1   - This script needs to be scheduled with Windows Task Manager, once scheudled it will remove all files with the following extenions, *.tsbak, *.json, *.zip from your 
                        designated backup folder - should be scheduled to run once your backup files have been moved to "off-site location"
Default_Site_Export.ps1 - This script will export your default Tableau Server's Site to the default location. Can be used when you completed server upgrades or as part of your backup routine
DPAPI_creds.ps1         - Allows for your TSM credentials to be saved in an encrypted file on your local server to be called into any scripts where you want to authenticate any server actions 
Example_Backup.ps1      - An example of a full backup script which can be edited for your own envrionment(s) 
Example_Email.ps1       - An example of a script with can be scheduled to run post backup, this script will attach a print out of the latest backup job and email the specified admin 
S3_Upload_Backup_.ps1   - An example of a script which will take your Tableau Server backup and upload to a specified AWS S3 bucket 
TSM_Backup.ps1          - Working backup script - edit for your environment
TSM_Cleanup.ps1         - Working mainteance - edit for your environment
TSM_Config_Backup.ps1   - Working config backup script - edit for your environment
TSM_Log_Zip.ps1         - Working script with zips all of your Tableau Server logs - useful for submitted logs on support requests  
