Write-Host "  _______ _      _____       _            "
Write-Host " |__   __| |    |  __ \     (_)           "
Write-Host "    | |  | |    | |__) |     _ _ __   ___ "
Write-Host "    | |  | |    |  _  /     | | '_ \ / __|"
Write-Host "    | |  | |____| | \ \     | | | | | (__ "
Write-Host "    |_|  |______|_|  \_\    |_|_| |_|\___|"
Write-Host "                     TLR inc"
Write-Host "                   Version 1.1"
$usrinput = Read-Host 'enter the number of pass'
$avg = 0
$i = 0
$temp = 0
$lowest = 110
$highest = 0

for ($i=0;$i -lt $usrinput; $i++) {

    $percentComplete = ($i / $usrinput) * 100

    Write-Progress -Activity 'running diagnosis' -Status "pass number $i " -PercentComplete $percentComplete
    $temp = (netsh wlan show interfaces) -Match '^\s+Signal' -Replace '^\s+Signal\s+:\s+|%' | Out-String
    $temp = [int]$temp
    If($temp -gt $highest)
    {
        $highest = $temp
    }
    If($temp -lt $lowest)
    {
        $lowest = $temp
    }
    $avg = $avg + $temp
    }
Write-Host '====================================='
$avg = $avg/$usrinput
Write-Host ("average WiFi signal quality :" + $avg + "%")
Write-Host ("highest recorded : " + $highest + "%")
Write-Host ("lowest recorded : " + $lowest + "%")
Write-Host '====================================='
Read-Host -Prompt 'press enter to leave'

