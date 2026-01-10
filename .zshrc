export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt autocd
autoload -U compinit; compinit


set -o vi
# Fix for backspace in vi mode
bindkey -v '^?' backward-delete-char


eval "$(starship init zsh)"


function remove_nvim_swapfiles() {
  rm $HOME/.local/state/nvim/swap/*
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# cargo
. "$HOME/.cargo/env"


# alias
alias vi="nvim"
alias gd="cd /Users/joonhohwangbo/Desktop/UCB-BAR/"
alias ls="ls -G"
alias l="ls -alhG"

PATH=$PATH:/opt/homebrew/bin
PATH=$PATH:"/Users/joonhohwangbo/bin"
PATH=$PATH:"/Users/joonhohwangbo/Desktop/UCB-BAR/coding/circt/build/bin"
PATH=$PATH:"/Users/joonhohwangbo/Desktop/UCB-BAR/coding/oss-cad-suite/bin"
PATH=$PATH:"/Users/joonhohwangbo/Library/Mobile Documents/iCloud~md~obsidian/Documents/bear/src/"

# Deno
export DENO_INSTALL="/Users/joonhohwangbo/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.slack/bin:$PATH"

# For superfile
export EDITOR=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/joonhohwangbo/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joonhohwangbo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joonhohwangbo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joonhohwangbo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Added by Windsurf
export PATH="/Users/joonhohwangbo/.codeium/windsurf/bin:$PATH"


export JAVA_HOME=$(/usr/libexec/java_home -v17)
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/Users/joonhohwangbo/.pixi/bin:$PATH"
export PATH=/Users/joonhohwangbo/.nimble/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"


# Stuff related to chipyard
export RISCV=/Volumes/sourcecode/riscv
export PATH=$RISCV/bin:$PATH

export TMPDIR="/Users/joonhohwangbo/coding/tmp"
export JAVA_TOOL_OPTIONS="-Djava.io.tmpdir=$TMPDIR"


export VERILATOR_ROOT=/Users/joonhohwangbo/.local/share/verilator
export PATH=$PATH:$HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/release
export PATH=$PATH:/Users/joonhohwangbo/Desktop/UCB-BAR/coding/mac-cli/target/release
