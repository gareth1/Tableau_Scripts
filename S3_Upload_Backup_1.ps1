# Constants
$sourcePath ="E:\"
$sourceFolder = "Backups"
$s3Bucket ="bucketname/Tableau"
$s3Folder ="foldername"

# Constants – Amazon S3 Credentials
$accessKeyID=""
$secretAccessKey=""

# Constants – Amazon S3 Configuration
$config=New-Object Amazon.S3.AmazonS3Config
$config.RegionEndpoint=[Amazon.RegionEndpoint]::"S3 region"
$config.ServiceURL = "s3://serviceurl"

# FUNCTION – Iterate through subfolders and upload files to S3
function RecurseFolders([string]$path) {
  $fc = New-Object -com Scripting.FileSystemObject
  $folder = $fc.GetFolder($path)
  foreach ($i in $folder.SubFolders) {
    $thisFolder = $i.Path

    # Transform the local directory path to notation compatible with S3 Buckets and Folders
    # 1. Trim off the drive letter and colon from the start of the Path
    $s3Path = $thisFolder.ToString()
    $s3Path = $s3Path.SubString(2)
    # 2. Replace back-slashes with forward-slashes
    # Escape the back-slash special character with a back-slash so that it reads it literally, like so: "\\"
    $s3Path = $s3Path -replace "\\", "/"
    $s3Path = "/" + $s3Folder + $s3Path

    # Upload directory to S3
    Write-S3Object -BucketName $s3Bucket -Folder $thisFolder -KeyPrefix $s3Path
  }

  # If subfolders exist in the current folder, then iterate through them too
  foreach ($i in $folder.subfolders) {
    RecurseFolders($i.path)
  }
}

# Upload subdirectories to S3
RecurseFolders($sourcePath)
