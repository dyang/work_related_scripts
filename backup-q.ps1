﻿# Backup currently applied patches (in queue) to a temp folder

$backupName = [System.Guid]::NewGuid().toString()
$backupRoot = "d:\hg-backup"
$backupDir = "$backupRoot\$backupName"

# create directory to hold backup files
New-Item $backupDir -type directory

$qappList = hg qapp

foreach ($q in $qappList)
{
    Copy-Item ".hg\patches\$q" $backupDir
    Write-Host "[Done] $q"
}

Write-Host "[Done] $backupDir"

