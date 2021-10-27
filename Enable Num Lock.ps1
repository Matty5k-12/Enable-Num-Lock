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

# If the requested state is the current state, we declare
# victory and go home
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
    # If the requested state is not the current state, then
    # we need to do a Num Lock press

    # Create a new instance of the WScript object and send
    # the NumLock key press to it
    (New-Object –ComObject WScript.Shell).SendKeys('{NUMLOCK}')
}
