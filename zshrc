# DESCRIPTION:
# #   A simple zsh configuration that gives you 90% of the useful features that I use everyday.
# #
# # AUTHOR:
# #   Geoffrey Grosenbach http://peepcode.com
# #   Additions by Vann Ek
#
#
# # RVM
# if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
#
# # Colors
autoload -U colors
colors
setopt prompt_subst
setopt extendedglob

#
# # Prompt
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"
#
#PROMPT='
#%~ : ${smiley}  %{$reset_color%}'

PROMPT='%~:→ %{$reset_color%}'
#PROMPT='${PWD/$HOME/~}:${smiley} %{$reset_color}'
#
# RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git-cwd-info)%{$reset_color%}'
#
# # Replace the above with this if you use rbenv
RPROMPT='%{$fg[white]%} ${smiley} $(~/.rbenv/bin/rbenv version-name) $(~/bin/git-cwd-info)%{$reset_color%}'
#
# # Show completion on first TAB
setopt menucomplete
#
# # Load completions for Ruby, Git, etc.
autoload compinit
compinit
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# PATH Exports
export PATH="/Library/PostgreSQL/8.4/bin/:/Users/vek/bin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local:/bin:$HOME/.rbenv/bin:$PATH"
export PG_BIN='/Library/PostgreSQL/8.4/bin/'
export NODE_PATH='/usr/local/lib/node_modules'

# aliases
#
# Terminal Stuff
alias ll='ls -al'
alias reload='source ~/.zshrc'

# Sublime Text 2 Aliases
alias st='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias stt='st .'

# Network stuff
alias ip='ifconfig | grep inet; echo "External IP:"; curl ifconfig.me'
alias flush_dns='dscacheutil -flushcache'

# **** GIT ALIASES ****
alias git-url='cat .git/config | grep url'
alias git-ci='git ci -a -m '
alias git-config='cat .git/config | less'
alias git-ignore='vi .gitignore'
alias git-add='git add .'
alias git-unstage='git co HEAD .'
alias git-rollback='git reset --hard HEAD~1' # rollback one commit
alias git-track='git co -t'
alias gsvndiff='git diff --no-prefix | sed -e "s/^diff --git [^[:space:]]*/Index:/" -e "s/^index.*/===================================================================/" '

# Plugins
#
source ~/config_files/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
