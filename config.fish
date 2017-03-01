#
#	TODO scripts
#   Open derived data folder for (possibly open) project
#   Shortcuts for ex opening apache, xcode derived, xcode, whatever,
#

# Key repeat speed
defaults write NSGlobalDomain KeyRepeat -int 0

#
# Aliases
#
alias ll='ls -alF'
alias la='ls -A'
alias  l='ls -CF'

#function ld
#    cd $argv[1]
#    l
#end

# Find word script. Takes a word and possibly a second -c for case insentive comparessh-add -l
function find_word
	python ~/.config/fish/find_word.py $argv
end

#
# Git
#
set -x PATH /usr/local/Cellar/git/2.0.0/bin $PATH

# Swift 3.0
set -x PATH /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $PATH

# kotlins (Kotlin as scripting)
set -x PATH ~/bin $PATH

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

# Virtualfish
# http://virtualfish.readthedocs.org/en/latest/install.html#customizing-your-fish-prompt
eval (python -m virtualfish)

# git aliases
alias gs='git status -s'
alias gd='git diff -b --color'
alias gl='git log'
alias gb='git branch'
alias gp='git pull'
alias GP='git push'
alias gc='git commit'
alias gco='git checkout'

# Macports
function port
    /opt/local/bin/port $argv
end

# Sublime Text
function subl
    /Applications/Sublime\ Text.app/Contents//SharedSupport/bin/subl $argv
end

#PyCharm
function pycharm
    /Applications/PyCharm.app/Contents/MacOS/pycharm $argv
end

# Tower
function tower
    /Applications/Tower.app/Contents/MacOS/gittower $argv
end

#postgres
set -x PATH /usr//local/Cellar/postgresql/9.3.4/bin/ $PATH

# Firefox
function firefox
    /Applications/Firefox.app/Contents/MacOS/firefox $argv
end

# Anaconda
set -x LC_ALL en_US.UTF-8
set -x LANGen_US.UTF-8

function conda
    /Users/ahkj/anaconda/bin/conda $argv
end

# pypy
function pypy
    /Users/ahkj/pypy-2.4.0-osx64/bin/pypy $argv
end

# FileMerge
function filemerge
    /Applications/Xcode6-Beta.app/Contents/Applications/FileMerge.app/Contents/MacOS/FileMerge
end

# Make sure ssh key is added
# ssh-add ~/.ssh/id_rsa
