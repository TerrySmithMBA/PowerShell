clear
Write-Host "     
                 
                    _=====_                               _=====_
                   / _____ \                             / _____ \
                 +.-'_____'-.---------------------------.-'_____'-.+
                /   |     |  '.     PLAYSTATION 1     .'  |  _  |   \
               / ___| /|\ |___ \                     / ___| /_\ |___ \
              / |      |      | ;  __           __  ; | _         _ | ;
              | | <---   ---> | | |__|         |__| | ||_|       (_)| |
              | |___   |   ___| ;SELECT       START ; |___       ___| ;
              |\    | \|/ |    /  _     ___      _   \    | (X) |    /|
              | \   |_____|  .','" "', |___|  ,'" "', '.  |_____|  .' |
              |  '-.______.-' /       \ANALOG/       \  '-._____.-'   |
              |               |       |------|       |                |
              |              /\       /      \       /\               |
              |             /  '.___.'        '.___.'  \              |
              |            /                            \             |
               \          /                              \           /
                \________/                                \_________/
`n" -ForegroundColor Gray
Sleep (3)

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
# Anything in this registry key path automatically executes when any user logs on.

$HKLM_Run = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
if (($HKLM_Run).ValueCount -gt 1) {
      Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host "   'SecurityHealth'" -ForegroundColor DarkYellow -NoNewline
      Write-Host "should be the only value provided in the Property field. Conduct further analysis if any other values are present." -ForegroundColor Gray
      Write-Host ($HKLM_Run | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
# Anything in this registry key path automatically executes when any user logs on.

$HKLM_RunOnce = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
if (($HKLM_RunOnce).ValueCount -gt 0) {
      Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host "    There should be no value provided in the Property field. Conduct further analysis if any other values are present." -ForegroundColor Gray
      Write-Host ($HKLM_RunOnce | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor
# Anything in this registry key path automatically executes when any user logs on.

$HKLM_Autorun = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Command Processor"
if ($HKLM_Autorun | Where-Object {$_.property -eq "Autorun"}) { 
      Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Command Processor" -ForegroundColor Yellow
      Write-Host "   
      Why is this a potential threat?
          
          - Anything in this registry key path automatically executes when any user logs on.
      
      Course of action if a potential threat is found:
           
           1. Get-Item -Path 'HKLM:\SOFTWARE\Microsoft\Command Processor'
           2. Conduct further analysis on the file path found in the Autorun field.     
                    - Example: Get-Content -path 'C:\users\public\malware.bat'" -ForegroundColor Gray "`n"
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\\Shell
# Anything in this registry key path automatically executes when any user logs on.

Function HKLM_Shell (){
$HKLM_Shell= (Get-ItemProperty -path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\").shell
if (!$HKLM_Shell) 
    {  }
elseif ($HKLM_Shell -ne "explorer.exe")     
    { Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon""`n`n" -ForegroundColor Yellow
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host "    explorer.exe" -ForegroundColor DarkYellow -NoNewline
      Write-Host " should be the only value provided below.`n" -ForegroundColor Gray
      Write-Host "    $HKLM_Shell`n" -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n" -ForegroundColor Gray
    }
}
HKLM_Shell

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices
# Anything in this registry key path automatically executes when any user logs on.

Function HKLM_Runservices () {
$HKLM_RunServices = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices" -ErrorAction SilentlyContinue
if (!$HKLM_RunServices)
    {  }
elseif (($HKLM_RunServices).ValueCount -gt 0) 
    { Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host ($HKLM_RunServices | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKLM_Runservices

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServicesOnce
# Anything in this registry key path automatically executes when any user logs on.

Function HKLM_RunServicesOnce () {
$HKLM_RunServicesOnce = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServicesOnce" -ErrorAction SilentlyContinue
if (!$HKLM_RunServicesOnce)
    {  }
elseif (($HKLM_RunServicesOnce).ValueCount -gt 0) 
    { Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServicesOnce" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host ($HKLM_RunServicesOnce | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKLM_RunServicesOnce

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
# Anything in this registry key path automatically executes when any user logs on.

Function HKLM_RunOnceEx () {
$HKLM_RunOnceEx = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx" -ErrorAction SilentlyContinue
if (!$HKLM_RunOnceEx)
    {  }
elseif (($HKLM_RunOnceEx).ValueCount -gt 0) 
    { Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host ($HKLM_RunOnceEx | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKLM_RunOnceEx

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
# Anything in this registry key path automatically executes when any user logs on.

Function HKLM_ExplorerRun () {
$HKLM_ExplorerRun = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" -ErrorAction SilentlyContinue
if (!$HKLM_ExplorerRun)
    {  }
elseif (($HKLM_ExplorerRun).ValueCount -gt 0) 
    { Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host ($HKLM_ExplorerRun | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKLM_ExplorerRun

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify
# Anything in this registry key path automatically executes when any user logs on.

Function HKLM_Notify () {
$HKLM_Notify = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify" -ErrorAction SilentlyContinue
if (!$HKLM_Notify)
    {  }
elseif (($HKLM_Notify).ValueCount -gt 0) 
    { Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host ($HKLM_Notify | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKLM_Notify

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit.exe
# Anything in this registry key path automatically executes when any user logs on.

Function HKLM_Userinit () {
$HKLM_Userinit = (Get-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\").Userinit
if (!$HKLM_Userinit) 
    {  } 
elseif ($HKLM_Userinit -ne "C:\windows\system32\userinit.exe,")      
    { Write-Host "Potential threat found in: HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon""`n`n" -ForegroundColor Yellow
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host "    C:\windows\system32\userinit.exe," -ForegroundColor DarkYellow -NoNewline
      Write-Host " should be the only value provided below.`n" -ForegroundColor Gray
      Write-Host "    $HKLM_Userinit`n" -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n" -ForegroundColor Gray
    }
}
HKLM_Userinit

# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ShellServiceObjectDelayLoad
# Anything in this registry key path automatically executes when any user logs on.

$HKLM_ShellServiceObjectDelayLoad = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ShellServiceObjectDelayLoad"
if (($HKLM_ShellServiceObjectDelayLoad).ValueCount -gt 0) {
      Write-Host "Potential threat found in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ShellServiceObjectDelayLoad" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Google information regarding present GUID" -ForegroundColor Gray
      Write-Host ($HKLM_ShellServiceObjectDelayLoad | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# HKEY_LOCAL_MACHINE\SOFTWARE\\Microsoft\Windows NT\CurrentVersion\Windows\
# Values listed in AppInit_DLLs are loaded when any process is started.

$HKLM_AppInit_DLLs = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Windows\" -Name AppInit_DLLs)
if (($HKLM_AppInit_DLLs).ValueCount -gt 0) {
      Write-Host "Potential threat found in: HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Windows\" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Values listed in AppInit_DLLs are loaded when any process is started.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present in the AppInit_DLLs field. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'" -ForegroundColor Gray
      Write-Host ($HKLM_AppInit_DLLs | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager
# Smss.exe will launch anything present in the BootExecute key at HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager.

Function HKLM_BootExecute () {
$HKLM_BootExecute = ((Get-ItemProperty -Path "HKLM:\\SYSTEM\ControlSet001\Control\Session Manager").bootexecute)
if (!$HKLM_BootExecute) 
    {  }
elseif ($HKLM_BootExecute -ne "autocheck autochk *")
    { Write-Host "Potential threat found in: HKLM:\\SYSTEM\ControlSet001\Control\Session Manager""`n`n" -ForegroundColor Yellow
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Smss.exe will launch anything present in the BootExecute key at HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host "           autocheck autochk *" -ForegroundColor DarkYellow -NoNewline
      Write-Host " should be the only value provided below.`n" -ForegroundColor Gray
      Write-Host "           $HKLM_BootExecute" -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKLM_BootExecute

# HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
# Anything in this registry key path automatically executes when the current user logs on.

$HKCU_Run = Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
if (($HKCU_Run).ValueCount -gt 1) {
     Write-Host "Potential threat found in: HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -ForegroundColor Yellow "`n`n"
      Write-Host "   'SecurityHealth'" -ForegroundColor DarkYellow -NoNewline
      Write-Host "should be the only value provided in the Property field. Conduct further analysis if any other values are present." -ForegroundColor Gray
      Write-Host ($HKCU_Run | Out-String) -ForegroundColor Gray
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
# Anything in this registry key path automatically executes when the current user logs on.

$HKCU_RunOnce = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
if (($HKCU_RunOnce).ValueCount -gt 0) {
      Write-Host "Potential threat found in: HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" -ForegroundColor Yellow "`n`n"
      Write-Host "   'SecurityHealth'" -ForegroundColor DarkYellow -NoNewline
      Write-Host "should be the only value provided in the Property field. Conduct further analysis if any other values are present." -ForegroundColor Gray
      Write-Host ($HKCU_RunOnce | Out-String) -ForegroundColor Gray
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# HKEY_CURRENT_USER\SOFTWARE\Microsoft\Command Processor
# Anything in this registry key path automatically executes when the current user logs on.

$HKCU_Autorun = Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Command Processor"
if ($HKCU_Autorun | Where-Object {$_.property -eq "Autorun"}) { 
      Write-Host "Potential threat found in: HKCU:\SOFTWARE\Microsoft\Command Processor" -ForegroundColor Yellow
      Write-Host "   
      Why is this a potential threat?
          
          - Anything in this registry key path automatically executes when the current user logs on.
      
      Course of action if a potential threat is found:
           
           1. Get-Item -Path 'HKCU:\SOFTWARE\Microsoft\Command Processor'
           2. Conduct further analysis on the file path found in the Autorun field.     
                    - Example: Get-Content -path 'C:\users\public\malware.bat'" -ForegroundColor Gray "`n"
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\\Shell
# Anything in this registry key path automatically executes when any user logs on.

Function HKCU_Shell () {
$HKCU_Shell= (Get-ItemProperty -path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\").shell
if (!$HKCU_Shell) 
    {  }
elseif ($HKCU_Shell -ne "explorer.exe")     
    { Write-Host "Potential threat found in: HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon""`n`n" -ForegroundColor Yellow
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host "    explorer.exe" -ForegroundColor DarkYellow -NoNewline
      Write-Host " should be the only value provided below.`n" -ForegroundColor Gray
      Write-Host "    $HKCU_Shell`n" -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n" -ForegroundColor Gray
    }
}
HKCU_Shell

# HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices
# Anything in this registry key path automatically executes when any user logs on.

Function HKCU_RuneServices () {
$HKCU_RunServices = Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices" -ErrorAction SilentlyContinue
if (!$HKCU_RunServices)
    {  }
elseif (($HKCU_RunServices).ValueCount -gt 0) 
    { Write-Host "Potential threat found in: HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host ($HKCU_RunServices | Out-String) -ForegroundColor DarkYellow -NoNewline
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKCU_RuneServices

# HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServicesOnce
# Anything in this registry key path automatically executes when any user logs on.

Function HKCU_RuneServicesOnce () {
$HKCU_RunServicesOnce = Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServicesOnce" -ErrorAction SilentlyContinue
if (!$HKCU_RunServicesOnce)
    {  }
elseif (($HKCU_RunServicesOnce).ValueCount -gt 0) 
    { Write-Host "Potential threat found in: HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host ($HKCU_RunServicesOnce | Out-String) -ForegroundColor DarkYellow -NoNewline
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKCU_RuneServicesOnce

# HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
# Anything in this registry key path automatically executes when any user logs on.

Function HKCU_ExplorerRun () {
$HKCU_ExplorerRun = Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" -ErrorAction SilentlyContinue
if (!$HKCU_ExplorerRun)
    {  }
elseif (($HKCU_ExplorerRun).ValueCount -gt 0) 
    { Write-Host "Potential threat found in: HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" -ForegroundColor Yellow "`n`n"
      Write-Host "    Why is this registry key value potential threat?`n`n" -ForegroundColor Gray
      Write-Host "           - Anything in this registry key path automatically executes when any user logs on.`n`n" -ForegroundColor Gray
      Write-Host "    Course of action if a potential threat is found:`n`n" -ForegroundColor Gray
      Write-Host "           - Conduct further analysis if any values are present. Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'`n`n" -ForegroundColor Gray
      Write-Host ($HKCU_ExplorerRun | Out-String) -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
    }
}
HKCU_ExplorerRun

# Startup Folder
# Anything in this folder automatically executes when any user logs on.

$Folder_Startup = Get-ChildItem -Force "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
if (($Folder_Startup).count -gt 1) {
      Write-Host "Potential threat found in: C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" -ForegroundColor Yellow
      Write-Host "     
        Why is this a potential threat?
           
           - Anything in this folder automatically executes when any user logs on.

        Course of action if a potential threat is found:

            1. Get-ChildItem -Force -Path 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp'
            2. Conduct further analysis on the files found in the 'Startup' folder" -ForegroundColor Gray "`n"
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

# profile.ps1 executes automatically when any user logs into the computer
# If profile.ps1 is found in $PSHOME, Get-Content profile.ps1 and verify no malicious activity is taking place
# Powershell will not run correctly if Profile.Ps1 name is changed. 

if (Get-ChildItem $PSHOME | Where-Object {$_.Name -like "*profile.ps1"}) {
      Write-Host "Potential threat found in: C:\Windows\System32\WindowsPowerShell\v1.0" -ForegroundColor Yellow
      Write-Host "
        Why is this a potential threat?
           
           - 'Profile.ps1' executes automatically when any user logs into the computer. 

        Course of action if 'Profile.ps1' is found:

            1. Get-Content -Path C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
            2. Conduct further analysis on the content in profile.ps1
                     - Example: Get-Content -Path 'C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1'" -ForegroundColor Gray "`n"
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
}

if (($env:path | Out-String).Split(";").Count -gt 6) {

    $PathsAdded = ($env:path | Out-String).Split(";").Count - 7   
      Write-Host "Potential threat found in: `$env:path" -ForegroundColor Yellow
      Write-Host "
      What is the potential threat?

             - By default, `$env:path has 6 pre-defined paths it checks in order. There is currently more than 6 paths set in this environmental variable meaning $PathsAdded has been added.
               The example provided below is the correct path.`n" -ForegroundColor Gray 
      Write-Host "                    - Example: C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;
                               C:\Users\terry\AppData\Local\Microsoft\WindowsApps;`n" -ForegroundColor DarkYellow
        
      Write-Host "      Course of action if a potential threat is found: 

            1. Compare the example given above to `$env:path to find discrepancies.
            2. Conduct analysis on all folder paths that do not match the example given.
                     - Example: Get-ChildItem -Force -Path 'C:\Users\Public\Documents'
            3. Conduct further analysis on files present.
                     - Example: Get-Content -force -Path 'C:\Users\Public\Documents\malware.sct'" -ForegroundColor Gray "`n"
      Write-Host $env:path -ForegroundColor DarkYellow
      Write-Host "_____________________________________________________________________________________________________________________________________________________________________`n`n" -ForegroundColor Gray
      }
