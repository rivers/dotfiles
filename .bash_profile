for file in ~/.{bash_prompt,bash_profile.local}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export EDITOR=vim

export HISTCONTROL=erasedups
export HISTSIZE=50000
export HISTFILESIZE=50000

export BASH_SILENCE_DEPRECATION_WARNING=1

export CLICOLOR=1
export GREP_OPTIONS="--color"
export LESS="--RAW-CONTROL-CHARS --no-init --quit-if-one-screen"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

shopt -s checkwinsize # check window size after each command
shopt -s extglob      # enable extended pattern-matching features
shopt -s histappend   # append to HISTFILE rather than overwrite
shopt -s nocaseglob   # treat pathname expansion as case-insensitive

alias ll="ls -Al"
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
