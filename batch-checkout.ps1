# Automatically create a pending changelist in P4 based on hg qtip
# including description and updated files (modified, added, deleted)

# Connection specific environment settings
# Please modify the following two env variables to fit your environment
$env:P4PORT = "FAKEDEPORT:1666"
$env:P4CLIENT = "FAKECLIENT"

$log = hg log -r tip --style dyang
$logXml = [xml]$log

# creating a pending changelist with the description retrieved from hg tip
$desc = $logXml.changeset.desc
$spec = p4 change -o | out-string
$change = $spec.replace("<enter description here>", $desc) | p4 change -i | out-string
$changeNumber = $change.Split(' ')[1]

echo "Editing files..."
foreach ($mod in $logXml.SelectNodes("changeset/files/modified/file"))
{
    p4 edit -c $changeNumber $mod.InnerText
}

echo "Adding files..."
foreach ($mod in $logXml.SelectNodes("changeset/files/added/file"))
{
    p4 add -c $changeNumber $mod.InnerText
}

echo "Deleting files..."
foreach ($mod in $logXml.SelectNodes("changeset/files/deleted/file"))
{
    p4 delete -c $changeNumber $mod.InnerText
}

echo "Describing change $changeNumber..."
p4 describe $changeNumber

echo "Done"
