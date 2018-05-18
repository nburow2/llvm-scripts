# this file is processed on each interactive invocation of bash

# avoid problems with scp -- don't process the rest of the file if non-interactive

[[ $- != *i* ]] && return

FPATH=$PATH

#PATH=$(echo $PATH | sed -e 's;:\.;;')

#ASAN_SYMBOLIZER_PATH=~/build/Release+Asserts/bin/llvm-symbolizer
#export ASAN_SYMBOLIZER_PATH
#ASAN_OPTIONS=symbolize=1
#export ASAN_OPTIONS

TIMEFORMAT=%R

export EDITOR=vim
export TERMINAL=xfce4-terminal
#export LD_LIBRARY_PATH=/home/nathan/bin/lib
export CC=clang
export CXX=clang++
#export PATH=/home/nathan/Code/llvm-clean/5.0.0/install/bin:$PATH:/home/nathan/Data/CFIXX/depot_tools
#export PATH=/home/nathan/Code/llvm-clean/4.0.1/release-install/bin:$PATH

PS1="\! \t \h:\w> "
HISTSIZE=50

function cd ()
{
  builtin cd "$@" && ls --color
}

function pdf ()
{
	nohup gv $1 &
}

function vset()
{
    amixer sset Master "$@"%
}

function remote()
{
    ssh nburow@"$@".cs.purdue.edu
}

function ws()
{
    i3-msg rename workspace $1 to "$1: $2"
}

function mcat()
{
    head -n $3 $1 | tail -n +$2
}

alias ls="ls --color"
alias cls="clear; ls"
alias vrc="vim ~/.bashrc"
alias src="source ~/.bashrc"
alias vi="vim"
alias ll="ls -l"
alias la="ls -al"
alias old="ls -altr"
alias h="history"
