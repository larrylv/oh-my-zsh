## Load smart urls if available
for d in $fpath; do
	if [[ -e "$d/url-quote-magic" ]]; then
		if [[ -e "$d/bracketed-paste-magic" ]]; then
			autoload -Uz bracketed-paste-magic
			zle -N bracketed-paste bracketed-paste-magic
		fi
		autoload -U url-quote-magic
		zle -N self-insert url-quote-magic
	fi
done

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-R"

## super user alias
alias _='sudo'
alias please='sudo'

## more intelligent acking for ubuntu users
alias afind='ack-grep -il'

# only define LC_CTYPE if undefined
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
	export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi

# recognize comments
setopt interactivecomments
