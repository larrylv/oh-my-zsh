#!/usr/bin/env zsh

autoload colors
colors
autoload -U add-zsh-hook

cyan="$fg_bold[cyan]"
yellow="$fg_bold[yellow]"
magenta="$fg_bold[magenta]"
red="$fg_bold[red]"
green="$fg_bold[green]"
light_green="$fg[green]"
blue="$fg_bold[blue]"

ZSH_THEME_GIT_PROMPT_PREFIX="$blue git:($yellow"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="$blue) $green✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="$blue) $red✗"
ZSH_THEME_GIT_PROMPT_STASH=" $magenta#"
ZSH_THEME_GIT_PROMPT_NOSTASH=""

function parse_git_stash() {
  if [[ -n $(git stash list 2> /dev/null) ]]; then
echo "$ZSH_THEME_GIT_PROMPT_STASH"
  else
echo "$ZSH_THEME_GIT_PROMPT_NOSTASH"
  fi
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(parse_git_stash)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT=$'%{$cyan%}➜  %{$magenta%}%~ %{%{$blue%}ruby:($yellow$(rbenv_prompt_info)%{$blue%})%}%{$(git_prompt_info)%}%{$blue%}%{$reset_color%}
%{$light_green%}\$%{$reset_color%} '
