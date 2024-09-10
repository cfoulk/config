Import-Module PSReadLine
Set-PSReadLineOption -EditMode Vi

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}

Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange 
# oh-my-posh init pwsh | Invoke-Expression
# oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-osh/themes/huvix.omp.json | Invoke-Expression
# oh-my-posh init pwsh --config ~/huvix.omp.json | Invoke-Expression

# function Prompt { 
#     # ANSI escape code for bold text
#     $bold = "`e[1m"
#     # ANSI escape code to reset formatting
#     $reset = "`e[0m"
#     # Get the current directory
#     $currentDir = Get-Location

#     # Display the username, computer name, and current directory
#     # $prompt = "$env:USERNAME@$env:COMPUTERNAME $currentDir> "
#     $prompt = "$bold$currentDir>"

#     # Set the color of the prompt text
#     Write-Host $prompt -NoNewline -ForegroundColor DarkYellow

#     # Return a prompt character
#     return " "
# }

# Load the custom prompt
Prompt
# Define a custom function to accept the suggestion
function Accept-SuggestionWithShiftTab {
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
}

# Remap Shift+Tab to the custom function
Set-PSReadLineKeyHandler -Chord Shift+Tab -ScriptBlock { Accept-SuggestionWithShiftTab }

$Env:KOMOREBI_CONFIG_HOME = Join-Path -P $env:USERPROFILE -ChildPath '\config\komorebi\'

Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim

function shelledit {
    nvim "$PROFILE"
}

function termedit {
    $path = Join-Path -P $env:USERPROFILE -ChildPath 'AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json'
    nvim $path
}

function windowedit {
    $path = Join-Path -P $env:USERPROFILE -ChildPath 'config\komorebi\komorebi.json'
    nvim $path
}

function vimconfig {
    $path = Join-Path -P $env:USERPROFILE -ChildPath 'config\nvim'
    Set-Location $path
    nvim init.lua
}

function ahkedit {
    $path = Join-Path -P $env:USERPROFILE -ChildPath 'Documents\AutoHotKey\'
    Set-Location $path
    nvim
}

function notes {
    $file = Get-ChildItem -Path "$HOME\Documents\Unorganized Notes" -Include @("*.md","*.txt") -Recurse | Select-Object -ExpandProperty FullName | fzf
    if ($file) {
        nvim $file
    }
}

function obsid {
    $vaults = "$HOME\Documents\Obsidian Vaults"
    $file = Get-ChildItem -Path "$HOME\Documents\Obsidian Vaults" -Include @("*.md","*.txt") -Recurse | Select-Object -ExpandProperty FullName | fzf
    if ($file) {
        Set-Location $vaults
        nvim $file
    }
}

function proj {
    $directory = Get-ChildItem -Path "$HOME\code" -Directory -Depth 1 -Exclude ".*"| Select-Object -ExpandProperty FullName | fzf
    if ($directory) {
        Set-Location $directory
        nvim
    }
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
