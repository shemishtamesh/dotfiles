# enable color support of ls and also add handy aliases:
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias ls='ls --color=always'
    alias l='exa --color=always --git --icons=always'
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_SPACE

# History for cd command:
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
fi
}
zle -N zle-keymap-select
zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

## make exit move to main tmux session and kill last session
#alias exit='
#    if [ $(tmux display-message -p "#S") != "main" ] && (( $(($(tmux list-windows | wc -l) + $(tmux list-panes | wc -l))) <= 2 ));
#    then
#        tmux new -s main -d
#        tmux switch -t main
#        tmux kill-session -t $(tmux display-message -p "#S")
#        return
#    fi
#    exit
#'
#
## start tmux and attach to main session if exists, otherwise create it
#if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then exec tmux new-session -A -s main; fi

# dotfiles alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# connect to work pc
alias work="ssh -i $HOME/.ssh/work_key shemishtamesh@192.168.1.3 -t '/opt/homebrew/bin/tmux -u attach || /opt/homebrew/bin/tmux -u new-session -As default'"

# copy (y) and paste (p)
alias y='xsel --clipboard --input'
alias p='xsel --clipboard --output'

# set options
setopt promptsubst  # enable prompt theme
setopt autocd  # dosn't need `cd` before paths

# enable rust programs (cargo, rustup, rustc)
. "$HOME/.cargo/env"

# use nvim as a manpager and default editor
export MANROFFOPT=-c
export MANWIDTH=999
export MANPAGER="nvim +Man!"
export EDITOR="nvim"

# functions:
function bak() {
    local filename="$1"
    if [[ "$filename" =~ .bak$ ]]; then
        mv "$filename" "${filename%.bak}";
        return 0;
    else
        mv "$filename" "$filename.bak";
        return 0;
    fi
    echo "Error: $filename is not a valid file or directory.";
    return 1;
}

transfer() {
    if [ $# -eq 0 ];then
        echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;
        return 1;
    fi;
    if tty -s;then
        file="$1";
        file_name=$(basename "$file");
        if [ ! -e "$file" ];
        then echo "$file: No such file or directory">&2;
            return 1;
        fi;
        if [ -d "$file" ];then
            file_name="$file_name.zip" ,;
            (cd "$file"&&zip -r -q - .) | curl -v --progress-bar -H "Max-Downloads: 1" --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null,;
        else
            cat "$file" | curl -v --progress-bar -H "Max-Downloads: 1" --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null;
        fi;
    else
        file_name=$1;
        curl -v --progress-bar -H "Max-Downloads: 1" --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null;
    fi;
}

# Function extract for common file formats
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in "$@"
        do
            if [ -f "$n" ] ; then
                case "${n%,}" in
                    *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                        tar xvf "$n"       ;;
                    *.lzma)      unlzma ./"$n"      ;;
                    *.bz2)       bunzip2 ./"$n"     ;;
                    *.cbr|*.rar)       unrar x -ad ./"$n" ;;
                    *.gz)        gunzip ./"$n"      ;;
                    *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
                    *.z)         uncompress ./"$n"  ;;
                    *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                        7z x ./"$n"        ;;
                    *.xz)        unxz ./"$n"        ;;
                    *.exe)       cabextract ./"$n"  ;;
                    *.cpio)      cpio -id < ./"$n"  ;;
                    *.cba|*.ace)      unace x ./"$n"      ;;
                    *)
                        echo "extract: '$n' - unknown archive method"
                        return 1
                        ;;
                esac
            else
                echo "'$n' - file does not exist"
                return 1
            fi
        done
    fi
}

IFS=$SAVEIFS

### PATH
if [ -d "$HOME/.bin" ] ;
then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ;
then PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
then PATH="$HOME/Applications:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

if [ -d "$HOME/.local/share/gem/ruby/3.0.0/bin/" ] ;
then PATH="$HOME/.local/share/gem/ruby/3.0.0/bin/:$PATH"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/shemishtamesh/Application/google-cloud-sdk/path.zsh.inc' ]; then . '/home/shemishtamesh/Application/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/shemishtamesh/Application/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/shemishtamesh/Application/google-cloud-sdk/completion.zsh.inc'; fi

# # enable pyenv (pyenv init)
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias cp-yes="cp"
alias mv-yes='mv'
alias rm-yes='rm'

# pacman aliases
# alias psync="sudo pacman -S || paru -S"
alias psync="paru -S"
# alias pupdate="sudo pacman -Syu && paru -Syu"
alias pupdate="paru -Syu"
# alias premove="sudo pacman -Rsn || paru -Rsn"
alias premove="paru -Rsn"
# alias premove-unneeded="sudo pacman -Rsn \$(pacman -Qdtq); paru -Rsn \$(paru -Qdtq)"
alias premove-unneeded="paru -Rsn \$(paru -Qdtq)"

# backup alias
alias backup="sudo mount /dev/sda3 /mnt/backup && sudo rsync -aAXHv --exclude={\"/dev/*\",\"/proc/*\",\"/sys/*\",\"/tmp/*\",\"/run/*\",\"/mnt/*\",\"/media/*\",\"/lost+found\",\"/swapfile\"} / /mnt/backup/archbackup/ && notify-send \"backup done.\" && sudo umount /mnt/backup"

# trashbin rm aliases
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias sudo='sudo '

# aplication aliases
#alias spotify="spotify --no-sandbox"
alias ttt="tt -showwpm -noskip -notheme -json "$HOME/.tt/never_to_have_been.txt" >> $HOME/logs/tt.json"
alias n="nvim"

# plugins
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

source $HOME/.config/zsh/fzf.zsh

source <(atuin init zsh)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
ZSH_HIGHLIGHT_STYLES[comment]='fg=gray,bold'

