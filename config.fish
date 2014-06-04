# Key repeat speed
defaults write NSGlobalDomain KeyRepeat -int 0

#
# Aliases
#
alias ll='ls -alF'
alias la='ls -A'
alias  l='ls -CF'

function ld
    cd $argv[1]
    l
end

# Find word script. Takes a word and possibly a second -c for case insentive compare
function find_word
	python ~/.config/fish/find_word.py $argv
end

#
# Git
#
set -x PATH /usr/local/Cellar/git/2.0.0/bin $PATH

# Note: Modified version of 'Informative Git Prompt'
# TODO: Do I want this?
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

# git aliases
alias gs='git status -s'
alias gd='git diff -b --color'
alias gl='git log'
alias gb='git branch'
alias gp='git pull'
alias GP='git push'
alias gc='git commit'
alias gco='git checkout'


# Sublime Text
function subl
    /Applications/Sublime\ Text.app/Contents//SharedSupport/bin/subl $argv
end


# anaconda
set -x PATH ~/anaconda/bin $PATH


