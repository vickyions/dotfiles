#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
# The following lines were added by compinstall

#######SSL Keys for wireshark keep it disabled unless trying to analyze
#export SSLKEYLOGFILE=/home/migi/.config/wireshark/.ssl-key.log
#########################
#Qbittorent and QT5 fix HIDPI
#export QT_FONT_DPI="98 vym"
##########

#zstyle ':completion:*' completer _complete _ignored
##Autocompletion with an arrow-key driven interface with double tab, Also I think its working for the aliases too
#while in arch wiki th option to activate it "setopt COMPLETE_ALIASES" makes it
##to not work I don't know check it when it behaves differently
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/migi/.zshrc'
#autorehashing (has performance effect, so just use rehash after adding new packages) of autocompletion for new packages "rehash"
#zstyle ':completion:*' rehash true

#pure prompt path#####
fpath+=$HOME/.zsh/pure
# #######

autoload -Uz compinit promptinit
compinit
promptinit

######Oh-my-zsh's insensitive tab completion from its source .zshrc, i.e. cd desk on tab
#becomes cd Desktop/
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
#######

prompt pure
###pure single line prompt
prompt_newline='%666v'
PROMPT=" $PROMPT"
###########
#
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

export PATH="$PATH:/home/migi/.local/bin"

#####################My Settings##########################################
###Fish_like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#pkgfile "command not found" handler
source /usr/share/doc/pkgfile/command-not-found.zsh
#####
MOZ_ALLOW_DOWNGRADE=1
VBOX_USB=usbfs
######less###
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
#########less for man for coloured output######
man() {
	    LESS_TERMCAP_md=$'\e[01;31m' \
            LESS_TERMCAP_me=$'\e[0m' \
            LESS_TERMCAP_se=$'\e[0m' \
            LESS_TERMCAP_so=$'\e[01;44;33m' \
	    LESS_TERMCAP_ue=$'\e[0m' \
	    LESS_TERMCAP_us=$'\e[01;32m' \
	    command man "$@"
	}
#########
LS_COLORS=$LS_COLORS:'di=1;35:ln=36:so=32:pi=33:ex=31:bd=34;47:cd=34;43:su=30;41:sg=30;45:tw=30;42:ow=30;43' ; export LS_COLORS
#########

#####Export
export TERM=alacritty                                                   
export BROWSER=firefox
export EDITOR=vim                         
export QT_QPA_PLATFORMTHEME=qt5ct

#########Alias
#alias ls='ls -C --color=auto'
alias ls='exa --icons'
alias ums='/opt/ums/UMS.sh'
#alias sudo='doas'
alias ydl='yt-dlp'
alias music='mpv --playlist=mpvSongs.m3u --shuffle --loop-playlist'
alias hotspot='nmcli d wifi hotspot ssid migi password bhanjebeta'
alias rm='rm -i'
alias mkdir='mkdir -p -v'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias diff='colordiff'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias unsplashwall='sh /home/migi/.config/scripts/unsplashrandomwall.sh'
alias jprompts='sh /home/migi/.config/scripts/journal/jprompts.sh'
alias grayscale='sh /home/migi/.config/picom/grayscale.sh'
alias sys='systemctl'
alias todo='vim ~/todo'
##markdown to pdf
alias mdpandoc='pandoc /home/migi/.config/scripts/template.yaml '
#alias walupdate='sh ${HOME}/.config/scripts/walupdate.sh'
#Live web development using browser-syn from npm
alias serve="browser-sync start --server --files ."
##############Alias End#############
#
##########Dirstack##############
#remembers recent dir visted and helps to cd in them very quickly by printing
##he DIRSTACK saved using "dirs -v" and then "cd -[no. of dirstack]" to cd in it
autoload -Uz add-zsh-hook

DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
		dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
			[[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
		print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
	}
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='20'

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
#setopt PUSHD_IGNORE_DUPS
#
### This reverts the +/- operators.
#setopt PUSHD_MINUS
#################
####Dynamic xterm title

autoload -Uz add-zsh-hook

function xterm_title_precmd () {
		print -Pn -- '\e]2;%n@%m %~\a'
			[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
		}

	function xterm_title_preexec () {
			print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
				[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
			}

		if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
				add-zsh-hook -Uz precmd xterm_title_precmd
					add-zsh-hook -Uz preexec xterm_title_preexec
		fi
#######################
#Ignores a command from history when prpended with space
setopt histignorespace


