# ~/.zshrc

# fastfetch cuz I'm a dweeb

clear; fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# aliases section

# I fucking hate corporations, including apple, broadcom, ALMAWIFI
alias resetwl='doas modprobe -r wl; doas modprobe wl'

# config sharing between root and home user
alias updateRootCfg='doas .config/.updateRootConfig.sh'

# auto coloring for ls, grep
alias ls='ls --color=auto --hide=Downloads --hide=Monero'
alias grep='grep --color=auto'

# dweeb
alias btw='clear; fastfetch'

# package managing aliases
alias useless='yay -Qtdq'
alias ckweb='curl kernel.org; ping artixlinux.org'
alias updatepkglist='yay -Qqe > ~/.installedpkg'
alias update='yay -Syyu; updatepkglist'
alias uninstallpkg='doas pacman -Rscn'
alias installpkg='yay -S'
alias openpkglist='nvim ~/.installedpkg'

# hehe vim
alias vim='nvim'

# trash aliases
alias emptyTrash='rm -rf ~/trash/*'
alias EMPTYTRASH='doas rm -rf ~/trash/*'

# main system specific aliases
if [ "$(lsb_release -is 2>/dev/null)" = "Artix" ]; then
	alias sudo='doas'
	alias blue='doas sv up bluetoothd; bluetui'
	alias poweroff='doas poweroff'
	alias connect='nmcli connection up'
fi

# coding aliases
alias formatall='clang-format ./*'
alias openvm='distrobox enter'
alias gasSim='cd cppProjects/idealGasSim; openvm sburrUbuntu'

# zsh plugins sourcing scripts, for Artix and Ubuntu

if [ "$(lsb_release -is 2>/dev/null)" = "Artix" ]; then
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

if [ "$(lsb_release -is 2>/dev/null)" = "Ubuntu" ]; then
	source ~/.powerlevel10k/powerlevel10k.zsh-theme
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
	source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	export CPLUS_INCLUDE_PATH=/home/mogus/cppProjects/idealGasSim/root/include
fi

# useless ahh binds for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# p10k configuration
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

# fede uses weird commands
# ma quante volte devo scrivere -la!!!!!
# https://t.ly/AQtnW
alias ll='ls -la'
alias l='ls -l'

# zsh autosuggestions highlight fix
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8b3fb2"

# envVars setting

export PATH=.:$PATH
export MANPAGER='nvim +Man!'


# Created by `pipx` on 2025-11-25 12:55:19
export PATH="$PATH:/home/mogus/.local/bin"
