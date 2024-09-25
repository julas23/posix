right_triangle() { echo $'\ue0b0' }

prompt_indicator() {
    if [ $UID -eq 0 ]; then
        echo $'\u2570\U2500' $'\U000027A4' $'\U0000276E'$'\U0001F480'$'\U0000276F '
    else
        echo $'\u2570\U2500' $'\U000027A4' $'\U0000276E'$'\U0001F464'$'\U0000276F '
    fi
}

arrow_start() { echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B" }
arrow_end() { echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}" }

current_time() {
    ARROW_FG="016"
    ARROW_BG="015"
    NEXT_ARROW_FG="015"
    NEXT_ARROW_BG="075"
    echo "\u256D\U2500$(arrow_start)%*$(arrow_end)"
}

error_output() {
    ARROW_FG="016"
    ARROW_BG="075"
    NEXT_ARROW_FG="075"
    NEXT_ARROW_BG="203"
    echo "$(arrow_start){%(?..%?)}$(arrow_end)"
}

shell_running() {
    ARROW_FG="016"
    ARROW_BG="203"
    NEXT_ARROW_FG="203"
    NEXT_ARROW_BG="228"
    echo "$(arrow_start)[zsh]$(arrow_end)"
}

git_prompt() {
    ARROW_FG="016"
    ARROW_BG="228"
    NEXT_ARROW_FG="228"
    NEXT_ARROW_BG=""
    echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}

username() {
    if [ $UID -eq 0 ]; then
        ARROW_FG="196"
        ARROW_BG="015"
        NEXT_ARROW_FG="015"
        NEXT_ARROW_BG="074"
        echo "\u251C\U2500$(arrow_start)$(whoami)@$(hostname)$(arrow_end)"
    else
        ARROW_FG="016"
        ARROW_BG="015"
        NEXT_ARROW_FG="015"
        NEXT_ARROW_BG="074"
        echo "\u251C\U2500$(arrow_start)$(whoami)@$(hostname)$(arrow_end)"
    fi
}

directory() {
    ARROW_FG="016"
    ARROW_BG="074"
    NEXT_ARROW_FG="074"
    NEXT_ARROW_BG=""
    echo "$(arrow_start)%15~$(arrow_end)"
}

ZSH_THEME_GIT_PROMPT_PREFIX="<<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">>"
ZSH_THEME_GIT_PROMPT_DIRTY=" !!"
ZSH_THEME_GIT_PROMPT_CLEAN=" Ok"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='
  $(current_time)$(error_output)$(shell_running)$(git_prompt)$(git_prompt_status)
  $(username)$(directory)
  $(prompt_indicator) '