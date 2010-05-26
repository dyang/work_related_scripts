$source_dir = 'd:\ws\main\sources'

function ws
{
  cd $source_dir\client
}

function lib
{
  cd $source_dir\lib\debug
}

function record($name, $opts)
{
 Connectivity.VaultPro.exe /record=Record\$name.autoscr /recordOpts=$opts 
}

function replay($name, $opts)
{
  Connectivity.VaultPro.exe /replay=Record\$name.autoscr /replayResult=Replay\$name.autores /replayChkCmpt /replayOpts=$opts
}

function hgs
{
  gvim .hg\patches\series
}

function qbk
{
  $env:userprofile\github\work_related_scripts\backup-q.ps1 
}