# (Ctrl|Cmd)+R to navigate command history using fzf
function navigate_history() {
  local selected_command
  selected_command=$(history | fzf --tac --no-mouse --height=16 --border=top)
  if [[ -n $selected_command ]]; then
    BUFFER=$selected_command
    CURSOR=${#BUFFER}
    zle accept-line
  fi
}
zle -N navigate_history
bindkey '^R' navigate_history
