fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# ~/.zshrc
#
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias btw='clear; fastfetch'

alias useless='pacman -Qtdq'
alias ckweb='curl artixlinux.org; ping artixlinux.org'
alias updatepkglist='pacman -Qqe > ~/.installedpkg'
alias update='doas pacman -Syyu'
alias uninstallpkg='doas pacman -Rscn'
alias installpkg='doas pacman -S'

alias vim='nvim'

alias emptyTrash='rm -rf ~/trash/*'
alias EMPTYTRASH='doas rm -rf ~/trash/*'

alias berk='Hyprland'

alias openpkglist='nvim ~/.installedpkg'

alias sudo='doas'

alias formatall='clang-format ./*'

alias blue='doas sv up bluetoothd'
alias poweroff='doas poweroff'
alias connect='nmcli connection up'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd extendedglob

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mogus/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

# ma quante volte devo scrivere -la!!!!!
# https://t.ly/AQtnW
alias ll='ls -la'
alias l='ls -l'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8b3fb2"

export PATH=.:$PATH
export MANPAGER='nvim +Man!'
