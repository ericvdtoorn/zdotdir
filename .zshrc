# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Load .zstyles file with customizations.
[[ -r ${ZDOTDIR:-$HOME}/.zstyles ]] && source ${ZDOTDIR:-$HOME}/.zstyles

# Set prompt theme
typeset -ga ZSH_THEME
zstyle -a ':zephyr:plugin:prompt' theme ZSH_THEME
ZSH_THEME='p10k'

# Set helpers for antidote.
is-theme-p10k()     { [[ "$ZSH_THEME" == (p10k|powerlevel10k)* ]] }
is-theme-starship() { [[ "$ZSH_THEME" == starship* ]] }


# load the libaries (like antidote, our plugin manager)

# Load things from lib.
for zlib in $ZDOTDIR/lib/*.zsh; source $zlib
unset zlib


#
# Aliases
#

[[ -r ${ZDOTDIR:-$HOME}/.zaliases ]] && source ${ZDOTDIR:-$HOME}/.zaliases



#
# Completions
#

# Uncomment to manually initialize completion system, or let Zephyr
# do it automatically in the zshrc-post hook.
# ZSH_COMPDUMP=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdump
# [[ -d $ZSH_COMPDUMP:h ]] || mkdir -p $ZSH_COMPDUMP:h
# autoload -Uz compinit && compinit -i -d $ZSH_COMPDUMP

#
# Prompt
#

# Uncomment to manually set your prompt, or let Zephyr do it automatically in the
# zshrc-post hook. Note that some prompts like powerlevel10k may not work well
# with post_zshrc.
autoload -Uz promptinit && promptinit
prompt "$ZSH_THEME[@]"


# Manually call post_zshrc to bypass the hook
(( $+functions[run_post_zshrc] )) && run_post_zshrc


export EDITOR=nvim


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/erictoorn/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/erictoorn/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/erictoorn/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/erictoorn/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/erictoorn/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/erictoorn/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
# Configure tools
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"





test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Secretive Config (using fingerprint to ssh)
export SSH_AUTH_SOCK=/Users/erictoorn/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh





export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
# Check to see if pbzip2 is already on path; if so, set BZIP_BIN appropriately
#
#
#
#
#
#
#PATH MODIFICATIONS

export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.atuin/bin/env"
export PATH="$HOME/.bin:$HOME/.yarn/bin:$PATH"
export PATH="/Users/erictoorn/Development/tools/sratoolkit.3.0.1-mac64/bin:$PATH"

# initialize tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fnm env)"
eval "$(zoxide init zsh)"


#
#
# ALIASES
alias bz=$BZIP_BIN
tarb() {
  tar -cf "$1".tbz --use-compress-program="$BZIP_BIN" "$1"
}
untarbzip() {
  $BZIP_BIN -dc "$1" | tar x --exclude="._*"
}
alias buntar=untarbzip
type -P pbzip2 &>/dev/null && export BZIP_BIN="pbzip2"
# Otherwise, default to standard bzip2 binary
if [ -z $BZIP_BIN ]; then
  export BZIP_BIN="pbzip2"
fi


true

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
