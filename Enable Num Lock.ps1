Param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("On", "Off")]
    [String[]] $onoff='On'
)

# Get the current state of the Num Lock key
$CurrentState = [console]::NumberLock

# the RequestedState, based in the command line param.  
# On is true, Off is false
if ($onoff -eq 'On') {
    $RequestedState = $true
}
else {
    $RequestedState = $false
}

if ($RequestedState -eq $CurrentState) {
    if ($CurrentState -eq $false) 
    {
        Write-Host 'Num Lock is already off'
    }
    else {
        Write-Host 'Num Lock is already on'
    }
}
else {
    if ($CurrentState -eq $false) 
    {
        Write-Host 'Num Lock is off, turning on'
    }
    else {
        Write-Host 'Num lock is on, turning off'
    }
   

   
    (New-Object –ComObject WScript.Shell).SendKeys('{NUMLOCK}')
}
