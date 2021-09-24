# readline-style editing module
Import-Module PSReadLine

# enable vi mode
Set-PSReadLineOption -EditMode vi

# ^[ exits vi mode 
Set-PSReadlineKeyHandler -Chord Ctrl+[ -Function ViCommandMode  

# Change cursor for vi mode
Set-PSReadLineOption -ViModeIndicator Prompt 

# Fish-like autocomplete
Set-PSReadLineOption -PredictionSource History

# Environmental variables
$env:PYTHONSTARTUP = "$HOME\python_startup.py"
$env:FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
$env:FZF_DEFAULT_OPTS = "--bind=ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-h:backward-char,ctrl-l:forward-char,ctrl-b:backward-word,ctrl-e:forward-word,ctrl-w:forward-word"

# Aliases
Set-Alias -Name v -Value nvim
Set-Alias -Name open -Value Invoke-Item

# Function Aliases
Function .. {Set-Location ..}
Function ll {Get-ChildItem}
Function r {radian --no-history}
Function fzo {Invoke-Item $(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')}

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "$HOME\Anaconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

