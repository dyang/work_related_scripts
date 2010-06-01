# Automatically create a pending changelist in P4 based on hg tip
# including description and updated files (modified, added, deleted)

# Connection specific environment settings
# Please modify the following two env variables to fit your environment
$env:P4PORT = "NOVP4P01:1666"
$env:P4CLIENT = "Vault"

# Test p4 connection
Write-Host "Testing p4 connection..." -foregroundcolor yellow
p4 info
if ($? -ne $True)
{
    Write-Host "Unable to connect to p4" -foregroundcolor red
    return
}


$log = hg log -r tip --style dyang
$logXml = [xml]$log

# creating a pending changelist with the description retrieved from hg tip
$desc = $logXml.changeset.desc
$spec = p4 change -o | out-string
$change = $spec.replace("<enter description here>", $desc) | p4 change -i | out-string
$changeNumber = $change.Split(' ')[1]

Write-Host "Editing files..." -foreground yellow
foreach ($mod in $logXml.SelectNodes("changeset/files/modified/file"))
{
    p4 edit -c $changeNumber $mod.InnerText
}

Write-Host "Adding files..." -foreground yellow
foreach ($mod in $logXml.SelectNodes("changeset/files/added/file"))
{
    p4 add -c $changeNumber $mod.InnerText
}

Write-Host "Deleting files..." -foreground yellow
foreach ($mod in $logXml.SelectNodes("changeset/files/deleted/file"))
{
    p4 delete -c $changeNumber $mod.InnerText
}

Write-Host "Describing change $changeNumber..." -foreground yellow
p4 describe $changeNumber

Write-Host "Done" -foreground green
