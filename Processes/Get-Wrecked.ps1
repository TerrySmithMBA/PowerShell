clear
$Process = Get-WmiObject -Class Win32_Process

foreach ($Proc in $Process){
            
    $ParentProcessName =  (get-wmiobject -Class Win32_process | Where-Object {$_.processid -eq $Proc.parentprocessid}).name
        
        if ($Proc.processname -eq "System Idle Process" -and($Proc.ProcessId -ne "0" -or $Proc.ParentProcessId -ne "0")){
                 #System Idle Process
                 Write-Host "Potential threat found with process: " -ForegroundColor DarkYellow -NoNewline
                 Write-Host " System Idle process" -ForegroundColor DarkYellow "`n"
                 Write-Host "     - System Idle Process should have a ProcessID of 0 and a ParentProcessID of 0.`n"
        }
    
    
        if ($Proc.processname -eq "System" -and ($Proc.ProcessId -ne "4" -or $Proc.ParentProcessId -ne "0")){
                 #System
                 Write-Host "Potential threat found with process: " -ForegroundColor DarkYellow -NoNewline
                 Write-Host " System" -ForegroundColor DarkYellow "`n"
                 Write-Host "     - System should have a ProcessID of 4 and a ParentProcessID of 0.`n"
        
        }

        if ($Proc.processname -eq "smss.exe" -and ($Proc.ParentProcessId -ne "4")){
                 #smss.exe
                 Write-Host "Potential threat found with process: " -ForegroundColor DarkYellow -NoNewline
                 Write-Host " smss.exe" -ForegroundColor DarkYellow "`n"
                 Write-Host "     - smss.exe should have a ParentProcessID of 4.`n"
        
        }

                
        if ($Proc.processname -eq "wininit.exe" -and ($ParentProcessName)){
                 
                 #wininit.exe
                 Write-Host "Potential threat found with process: " -ForegroundColor DarkYellow -NoNewline
                 Write-Host " wininit.exe" -ForegroundColor DarkYellow "`n"
                 Write-Host "     - wininit.exe should have no ParentProcessID.`n"
        
        }  
         

    ($Proc | select ProcessName, ProcessID, @{n="ParentProcessName";e={ $ParentProcessName }}, ParentProcessID, Path, CommandLine  | Format-List | Out-String).trim()
    
    foreach ($establishedIP in (Get-NetTCPConnection | Where-Object {$_.owningprocess -eq $Proc.processid -and $_.state -eq "Established"})){
        Write-Host "Established       : $($establishedIP.LocalAddress):$($establishedIP.LocalPort)  ===>  $($establishedIP.RemoteAddress):$($establishedIP.RemotePort)"
    } 
    
    foreach ($establishedIP in (Get-NetTCPConnection | Where-Object {$_.owningprocess -eq $Proc.processid -and $_.state -eq "Listen"})){
        Write-Host "Listening         : $($establishedIP.LocalAddress):$($establishedIP.LocalPort)  ===>  $($establishedIP.RemoteAddress):$($establishedIP.RemotePort)"
    } 
    Write-Host "___________________________________________________________________________________________________________________________________`n"
        
}