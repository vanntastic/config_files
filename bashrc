# HELPFUL COMMAND REFERENCE
# whatis -- Display a summary of a command (rather than the entire manual)
# apropos -- Display a list of commands that pertain to (are apropos to) a keyword
# whereis -- Display information about the location of a command: the executable, the source code (if any), and the man pages.
# which -- Display which version of a command will execute (for when there are two, or more, commands with the same name installed on the system).
export PATH="/Library/PostgreSQL/8.4/bin/:/Users/vek/bin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local:/bin:$HOME/.rbenv/bin:$PATH"
export PG_BIN='/Library/PostgreSQL/8.4/bin/'
export NODE_PATH='/usr/local/lib/node_modules'
# rbenv helpers
eval "$(rbenv init -)"
#TIP: you can use the following args: $* = all arguments; $1 = first arg; $2 = second arg and so on

# **** MEMCACHED STUFF ****
EVENT_NOKQUEUE=yes
alias memcached_start='memcached -d -m 24 -p 11211 -vv; echo "memcache started on 11211"'
alias memcached_kill='killall memcached'
alias memcache_connect='telnet localhost 11211'

# **** SYSTEM STUFF ****
alias trail='tail -f'

# **** NETWORK STUFF ****
alias ip='ifconfig | grep inet; echo "External IP:"; curl ifconfig.me'
alias flush_dns='dscacheutil -flushcache'
#alias serve='python -m SimpleHTTPServer'

# **** STUFF FOR IRB ****
alias irbrc='vi ~/.irbrc'

# **** MONGO DB ****
# Use the homebrew version of mongodb instad
alias mongo_start='mongod run --config /usr/local/Cellar/mongodb/1.6.3-x86_64/mongod.conf'

# **** BASH EDITING ****
alias bashrc='vi ~/.bashrc'
alias reload_bash='. ~/.bashrc;. ~/.bash_login'
alias ll='ls -Al'

# **** SSH SHORTCUTS ****
alias ssh_config='vi ~/.ssh/config'
alias ssh_keys='mate ~/.ssh/known_hosts'

# **** OSX SHORTCUTS ****
alias enablepressandhold='defaults write -g ApplePressAndHoldEnabled -bool '

# **** RAILS/RUBY SPECIFIC ALIASES ****
alias console='./script/console'
alias server='./script/server'
alias plugin='./script/plugin'
alias plugins='ls vendor/plugins'
alias generate='./script/generate'
alias destroy='./script/destroy'
alias atr='autotest --rails'
alias edgify='rake rails:freeze:edge'
alias tasks='sake -T'
alias models='ls app/models'
alias test_log='tail -f log/test.log'
alias ch='cheat'
alias ch_sheets='cheat sheets | less'
alias thinweb='thin -R ~/config_files/thin_configs/static.ru start'

# **** SVN ALIASES ****
alias svn-files-to-add='svn st | grep ?'
alias svn-files-added='svn st | grep A'
alias svn-files-modified='svn st | grep M'
alias svn-files-deleted='svn st | grep D'
alias svn-ci='svn ci -m'

alias e='mate'

# **** CAP ALIASES ****
alias old_deploy='cap _1.4.1_ deploy'

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

# **** START SYNERGY HERE **** 
alias synergy-start-vannsrv='synergys -f --config ~/synergy-conf/vannsrv.conf'

# **** MYSQL ****
alias mysql_stop='sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
alias mysql_start='sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
mysql_admin () { mysql --user=root --password="$1"; }

# **** STATICMATIC HELPERS ****
alias	www_preview='staticmatic preview .'
alias www_build='staticmatic build .'

# **** JQUERY AND PLUGIN HELPERS ****
# install jquery 1.2.3
alias jquery_install='curl -O http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js;
                      mv jquery-1.3.2.min.js jquery.js'
# yeah... i do need this for rails...                      
alias jquery_install_rails='curl -O http://jqueryjs.googlecode.com/files/jquery-1.2.3.min.js;
            mv jquery-1.2.3.min.js public/javascripts/jquery.js'                      
            
alias apache_conf='mate /etc/apache2/httpd.conf'            
alias apache_restart='sudo apachectl restart'
alias apache_stop='sudo apachectl stop'
alias apache_start='sudo apachectl start'
alias apache_vhosts='sudo vi /private/etc/apache2/extra/httpd-vhosts.conf'
alias apache_access_log='tail -f /var/log/apache2/access_log'
alias apache_error_log='tail -f /var/log/apache2/error_log'

alias sqlite='sqlite3'
# a quick alias to download files using curl
alias dl='curl -O'
            
# install facebox via git                      
alias jquery_install_facebox='git clone git://github.com/defunkt/facebox'                      

# crashplan engine restart
cp_restart () {
  if [[ -n "$1" ]]; then
    echo "Stopping CrashPlan Engine..."
    sudo launchctl unload /Library/LaunchDaemons/com.crashplan.engine.plist
    echo "Starting CrashPlan Engine..."
    sudo launchctl load /Library/LaunchDaemons/com.crashplan.engine.plist
  else
    echo "Restarts crashplan engine"
  fi
}

# quick function for setting up a foundation based site using sass
new_foundation () {
  if [[ -n "$1" ]]; then
    compass create $1 -r ZURB-foundation --using ZURB-foundation --syntax sass --force
  else
    echo "USAGE : new_foundation <name of site>"
  fi
}

# scp keys for a server, useful when setting up a server for the very first time
# EX:
#   setup_keys you@yourhost.com
#   # now you should be able to get in w/o a password!
setup_keys () {
  if [[ -n "$1" ]]; then
    ssh $1 'mkdir -p ~/.ssh';
    scp ~/.ssh/id_rsa.pub $1:~/.ssh/key_tmp
    ssh $1 'cat ~/.ssh/key_tmp >> ~/.ssh/authorized_keys; rm ~/.ssh/key_tmp'
  else
    echo "USAGE : setup_keys [ssh_host_name]"
  fi
}

# run kicker hook for test/spec
kick_spec () {
  if [[ -n "$1" ]]; then
    kicker -e "specrb -as $1" .
  else
    echo "USAGE : kick_spec [path/to/test]"
  fi
}

# simple wrappers for running unit and functional tests in rails apps
# INSTEAD OF : ruby test/unit/user_test.rb
# DO THIS : test_unit user
test_unit () {
	if [[ -n "$1" ]]; then
		ruby test/unit/$1_test.rb;
	else
		echo "USAGE : test_unit [name_of_test]";
	fi
}

# abstract append text behavior into a function
append () {
  if [[ -n "$1" ]]; then
    echo $1 >> $2;
  else
    echo "USAGE : append 'your text' [file_to_append]";
  fi
}

# INSTEAD OF : ruby test/functional/users_controller_test.rb
# DO THIS : test_func user
test_func () {
	if [[ -n "$1" ]]; then
		ruby test/functional/$1_controller_test.rb;
	else
		echo "USAGE : test_func [name_of_test]";
	fi
}

test_spec () {
	if [[ -n "$1" ]]; then
		ruby $1 -rs;
	else
		echo "USAGE : test_spec [filename_of_test]";
	fi
}

#Useful shortcut for find a gem
find_gem () { gem list | grep "$1"; }

# clones a plugin from github for your rails project
# USAGE install_github_plugin [git_repo_url]
install_github_plugin () {

  if [[ -n "$1" ]]; then
    cd vendor/plugins;
    git clone $1;
    cd ../../;
    echo "Plugin installed successfully!";
  else
    echo "USAGE : install_github_plugin [git_repo_url]";
  fi
  
}

# yui compressor 
# compresses and minifies css/js files using yui compressor
# EX: compress [name_of_file] [path/to/compressed/file]
# grab more info about yui compressor @ http://developer.yahoo.com/yui/compressor/#work
compress () {
  
  if [[ -n "$1" ]]; then
    java -jar ~/bin/yuicompressor-2.4.2/build/yuicompressor-2.4.2.jar $1 -o $2
  else
    echo "EX: compress [name_of_file] [path/to/compressed/file]"
  fi
}


# toggles the display of the finder hidden files, pass true or false to it
show_hidden_files () {
	if [ -n "$1" ]; then
		defaults write com.apple.finder AppleShowAllFiles $1
		killall Finder
	else
		echo "USAGE: show_hidden_files [FALSE/TRUE]"
	fi	
}

# set up the svn:ignore props
svn_ignore () {
	if [ -n "$1" ]; then
		svn propedit svn:ignore "$1";
	else
		echo "USAGE: svn_ignore [folder]";
	fi	
}

# adds all svn files with awk
function svn-add () {
  svn status|awk '{if ($1 == "?") print $2}'|xargs svn add
}

# removes all svn files with awk
function svn-rm () {
  svn status|awk '{if ($1 == "!") print $2}'|xargs svn rm
}

# removes all deleted files / directories 
# kinda like what git rm . should do 
git_rm_all (){
  git st | grep deleted | sed -e 's/deleted: *//' | sed 's/# *//' | xargs git rm
}

# removes .svn dirs
function remove_svn () {
  find . -name .svn -print0 | xargs -0 rm -rf;
  echo "All .svn directories have been removed."
}

# quick mysql dump
# USAGE : db_dump [database] [username]
function db_dump () {
  if [[ -n "$1" ]]; then
    # dumping a mysql database to a file
    local DSTR=$(date +%Y-%m%d);
    local FNAME="$DSTR-$1-dump.sql";
    mysqldump --databases $1 --user $2 --password > $FNAME
    echo "$1 has been dumped successfully as : $FNAME";
  else
    echo "db_dump [database] [username]"
  fi
}

#displays the full path
# PS1='\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\] $ '
#displays just the working directory
# PS1="[ \W ]\\$ "
# dollar sign minimal
# PS1="\W : \\$ "
# caret minimal
# PS1="\W> "

case "$TERM" in
xterm*|rxvt*|vt100*)
    PROMPT_COMMAND='echo -ne "\033]0; ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

## GIT stuff
# super minimal prompt that'll display git branch if you're in the a git repo
PS1='\W$(__git_ps1 ":%s")> '
# git completion provided from the git repo at : http://bit.ly/26GbPb
source ~/.git_completion

# customize tabs and title
# PS1=$'\[\e];\]$PWD\[\a\]\[\e]1;\]$(basename $(dirname $PWD))/\W\[\a\]\u >> '
# PS1=$'\[\e]2;\]$PWD\[\a\]\[\e]1;$(basename $(dirname $PWD))/\W\[\a\]\$ '

# Old RVM stuff
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$HOME/local/bin:$PATH
