# Module imports
Import-Module PSReadLine  # readline-style editing module
Import-Module PSFzf  # command line fzf

# vi mode
Set-PSReadLineOption -EditMode vi
Set-PSReadlineKeyHandler -Chord Ctrl+"{" -Function ViCommandMode  
Set-PSReadLineOption -ViModeIndicator Prompt  # Change cursor for vi mode
Set-PSReadLineOption -PredictionSource History  # Fish-like autocomplete

# PSFzf 
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Environmental variables
$env:EDITOR = "nvim"
$env:PYTHONSTARTUP = "$HOME\python_startup.py"
$env:FZF_DEFAULT_COMMAND = 'fd -HI --type f'
$env:FZF_DEFAULT_OPTS = "--bind=ctrl-d:half-page-down,ctrl-u:half-page-up --reverse"
$env:FZF_CTRL_T_COMMAND = 'fd -HI --type f'
$env:FZF_ALT_C_COMMAND = 'fd -HI --type d'

# Aliases
Set-Alias -Name v -Value nvim
Set-Alias -Name open -Value Invoke-Item
Set-Alias -Name o -Value Invoke-Item
Set-Alias -Name fe -Value Invoke-FuzzyEdit
Set-Alias -Name ff -Value Invoke-FuzzyFasd
Set-Alias -Name fz -Value Invoke-FuzzyZLocation
Set-Alias -Name fgs -Value Invoke-FuzzyGitStatus
Set-Alias -Name fh -Value Invoke-FuzzyHistory
Set-Alias -Name fkill -Value Invoke-FuzzyKillProcess
Set-Alias -Name fd -Value Invoke-FuzzySetLocation
Set-Alias -Name ll -Value Get-ChildItem

Remove-Item alias:curl
Remove-Item alias:wget
Remove-Item alias:r

# Function Aliases
Function .. {Set-Location ..}
Function r {radian --no-history}
Function fzo {Invoke-Item $(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')}
Function fze {nvim $(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')}

# zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\vfaner\scoop\apps\miniconda3\current\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

