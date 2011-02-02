# HELPFUL COMMAND REFERENCE
# whatis -- Display a summary of a command (rather than the entire manual)
# apropos -- Display a list of commands that pertain to (are apropos to) a keyword
# whereis -- Display information about the location of a command: the executable, the source code (if any), and the man pages.
# which -- Display which version of a command will execute (for when there are two, or more, commands with the same name installed on the system).
export PATH="/Library/PostgreSQL/8.4/bin/:/Users/vek/bin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local:/bin:$PATH"
export PG_BIN='/Library/PostgreSQL/8.4/bin/'
#TIP: you can use the following args: $* = all arguments; $1 = first arg; $2 = second arg and so on

# **** MEMCACHED STUFF ****
EVENT_NOKQUEUE=yes
alias memcached_start='memcached -d -m 24 -p 11211 -vv; echo "memcache started on 11211"'
alias memcached_kill='killall memcached'
alias memcache_connect='telnet localhost 11211'

# **** SYSTEM STUFF ****
alias trail='tail -f'

# **** NETWORK STUFF ****
alias ip='ifconfig | grep inet'
alias flush_dns='dscacheutil -flushcache'

# **** STUFF FOR IRB ****
alias irbrc='vi ~/.irbrc'

# **** BASH EDITING ****
alias bashrc='vi ~/.bashrc'
alias reload_bash='. ~/.bashrc;. ~/.bash_login'
alias ll='ls -Al'

# **** SSH SHORTCUTS ****
alias ssh_config='vi ~/.ssh/config'
alias ssh_keys='mate ~/.ssh/known_hosts'

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
# since we don't use the stock ruby, let's ensure that that livereload works properly with osx's cocoaruby
alias reload='rvm use --system;livereload .'

# **** SVN ALIASES ****
alias svn_files_to_add='svn st | grep ?'
alias svn_files_added='svn st | grep A'
alias svn_files_modified='svn st | grep M'
alias svn_files_deleted='svn st | grep D'
alias svn_ci='svn ci -m'

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

# scp keys for a server, useful when setting up a server for the very first time
# EX:
#   setup_keys you@yourhost.com
#   # now you should be able to get in w/o a password!
#   TODO : update this to detect for previous authorized_keys, so it doesn't
#          delete or overwrite previous keys
setup_keys () {
  if [[ -n "$1" ]]; then
    ssh $1 'mkdir -p ~/.ssh';
    scp ~/.ssh/id_rsa.pub $1:~/.ssh/authorized_keys
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

jquery_install_plugin () {
	if [[ -n "$1" ]]; then
		svn export "svn://internal.innerfusion.us/lib/javascript/jquery/plugins/$1";
		echo "Jquery Plugin : $1 has been installed";
	else
		echo "USAGE : jquery_install_plugin [name_of_plugin]";
	fi
}

# this install jquery plugins for any rails apps
jquery_install_plugin_rails () {
	if [[ -n "$1" ]]; then
		svn export "svn://internal.innerfusion.us/lib/javascript/jquery/plugins/$1 public/javascripts/$1";
		echo "Jquery Plugin : $1 has been installed";
	else
		echo "USAGE : jquery_install_plugin [name_of_plugin]";
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

# function to apply templates from app_templates folder
rails_template () {
	if [[ -n "$1" ]]; then
	  rake rails:template LOCATION=~/rails/app_templates/$1.rb;
  else
    echo "USAGE : rails_template [name_of_template]";
    echo "-----------------------------------------";
    echo "Available Templates:";
    echo "-----------------------------------------";
    ls ~/rails/app_templates;
    echo "-----------------------------------------";
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

# retrieve all your favorite tasks from your the sake dir
get_tasks () { 
	cp ~/rails/sake_tasks/database.rake lib/tasks/database.rake;
	cp ~/rails/sake_tasks/test.rake lib/tasks/test.rake;
	cp ~/rails/sake_tasks/svn_tasks.rake lib/tasks/svn_tasks.rake
	echo "Your tasks has been copied over..."; 
}

install_rake () {
	cp ~/rake_files/Rakefile Rakefile;
	echo "Rake has been installed... the following tasks are available below:"
	echo "======"
	rake -T;
}

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

# generates a new wp child theme based on thematic 
# note : this generates a theme based on thematic 0.9, you can revert to thematic 0.8.1
#        by remove the '_0_9' suffix from wp_template_0_9
new_thematic_theme () {
  
  if [[ -n "$1" ]]; then
    svn_cp wordpress/themes/wp_template_0_9 wordpress/themes/$1;
    cd wp-content/themes;
    svn_co wordpress/themes/$1;
    cd ../../;
    echo "Your theme : $1 is generated and ready to go!";
  else
    echo "USAGE : new_thematic_theme [name_of_theme]";
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

# toggles space switching
space_switching () {
	if [ -n "$1" ]; then
		defaults write com.apple.Dock workspaces-auto-swoosh -bool $1
		killall Dock
	else
		echo "USAGE: space_switching [NO/YES]"
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

# commits to git and svn
svn_git_ci () {
	if [ -n "$1" ]; then
	  git add .;
		git commit -m "$1";
		svn_add_new;
		svn ci -m "$1";
	else
		echo "USAGE: svn_git_ci [message]";
	fi	
}

# runs svn up and pulls from origin master if using github
svn_github_up () {
	svn up;
	git pull origin master;
}

# gets the status for both svn and git
svn_git_st () {
  echo "SVN status";
  echo "--";
  svn st;
  echo "==";
  echo "GIT status";
  echo "--"
  git st;
}


# create a standard project with trunk/tags/branches structure
svn_new_project () {
	if [ -n "$1" ]; then
		svn cp "svn://internal.innerfusion.net/templates/project_skeleton" "svn://internal.innerfusion.net/$1" "-m $2";
		echo "Copying new project: $1 ..."
		echo "Checking out new project: $1 ..."
		svn co "svn://internal.innerfusion.net/$1/trunk" "$1"
	else
		echo "USAGE: svn_new_project [name_of_project] [message]"	
	fi
}

# creates a rails plugin template and copies it to the main plugin repos and checks it out to the
# current rails project
new_rails_plugin () {
	if [ -n "$1" ]; then
		echo "Grabbing and Copying Plugin Template..."
		svn cp svn://internal.innerfusion.us/templates/rails_plugin svn://internal.innerfusion.us/rails/plugins/"$1" "-m '[ADD] creating a rails plugin named : $1'"
		
    # rename all the files based on the plugin name
		echo "Renaming all plugin files"
		svn mv svn://internal.innerfusion.us/rails/plugins/"$1"/lib/template.rb svn://internal.innerfusion.us/rails/plugins/"$1"/lib/"$1".rb -m "renaming template file to $1"
		
		svn mv svn://internal.innerfusion.us/rails/plugins/"$1"/test/template_test.rb svn://internal.innerfusion.us/rails/plugins/"$1"/test/"$1"_test.rb -m "renaming test file to $1"
		
	  svn mv svn://internal.innerfusion.us/rails/plugins/"$1"/tasks/template_tasks.rake svn://internal.innerfusion.us/rails/plugins/"$1"/tasks/"$1"_tasks.rake -m "renaming task file to $1"
  	
		echo "Checking out and installing plugin externally : $1"
		./script/plugin install "$1" -x
	else
		echo "USAGE : new_rails_plugin [name_of_plugin]"
	fi	
}

# generate a rails app with my special defaults
new_rails_app () {
  if [ -n "$1" ]; then
    echo "Generating Rails App : $1...";
    rails $1;
    echo "Setting up svn...";
    svn_mkdir $1;
    echo "Setting up tags...";
    svn_mkdir "$1/tags";
    echo "Setting up trunk...";
    svn_mkdir "$1/trunk";
    echo "Setting up branches...";
    svn_mkdir "$1/branches";
    echo "Importing $1/trunk/$1...";
    svn_import $1 "$1/trunk/$1";
    echo "Cleaning up..."
    rm -rf $1;
    svn_co "$1/trunk/$1";
    cd $1;
    rm config/database.yml;
    rm public/index.html;
    rm -rf tmp/*;
    svn_rm_all;
    svn ci -m "removing old defaults...";
    echo "ignore database.yml and tmp files...";
    svn propset svn:ignore "*.yml" config;
    svn propset svn:ignore "*" tmp;
    svn propset svn:ignore "*" log;
    svn up;
    svn ci -m "commit ignore changes...";
    echo "applying templates...";
    # add more templates here if needed
    rake rails:template LOCATION=~/rails/app_templates/db.rb;
    rake rails:template LOCATION=~/rails/app_templates/jquery.rb;
    svn_add_new
    svn ci -m "added database example yml";
    mkdir tmp/pids;
    mkdir tmp/cache;
    mkdir tmp/sessions;
    mkdir tmp/sockets;
    echo "Done."
    mate .;
  else
    echo "USAGE: new_rails_app [name_of_project]" 
  fi
}

# this will generate a mephisto cms based of the git repo...
new_mephisto_cms () {
  if [[ -n "$1" ]]; then
    echo "Generating new project structure"
    svn mkdir "svn://internal.innerfusion.us/$1" "-m 'Create initial project folder for $1'";
    svn mkdir "svn://internal.innerfusion.us/$1/tags" "-m 'Creating tags folder for $1'";
    svn mkdir "svn://internal.innerfusion.us/$1/trunk" "-m 'Creating trunk folder for $1'";
    svn mkdir "svn://internal.innerfusion.us/$1/branches" "-m 'Creating branches folder for $1'";
    echo "Grabbing and copying template over"
    svn cp "svn://internal.innerfusion.us/templates/mephisto" "svn://internal.innerfusion.us/$1/trunk/$1" "-m 'copying mephisto template over'";
    echo "Initial checkout for $1"
    svn co "svn://internal.innerfusion.us/$1/trunk/$1"
    echo "---"
    echo "Alright time to kick some ass!"
    echo "---"
  fi
}

# create a new php project from the silverstreak framework
new_php_project () {
  if [[ -n "$1" ]]; then
    echo "Creating Subversion Repo..."
    svn mkdir "svn://internal.innerfusion.net/www/$1" "-m Creating Project : $1"; 
    echo "Checking Out Repo...";
    svn co "svn://internal.innerfusion.net/www/$1";
    echo "Setting Up Core Files...";
    git clone git@github.com:vanntastic/silverstreak.git "$1/silverstreak";
    echo "Almost Done..."
    svn status "$1" | grep "^?" | sed -e "s/? *//" | sed -e "s/ / /g" | xargs svn add;
    svn ci "$1" "-m Silverstreak core files commit";
    echo "==";
    echo "DONE!";
  else
    echo "USAGE: new_php_project [name_of_project]"	
  fi
}

# create a new layout structure ... for testing layouts
new_layout_for () {
if [ -n "$1" ]; then
	echo "Grabbing and copying layout template over..."
	svn cp "svn://internal.innerfusion.net/www/templates/layouts" "svn://internal.innerfusion.net/www/layouts/$1" "-m 'Copying layout structure for $1"
	echo "Updating layouts"
	cd ~/Sites/layouts
	svn up
	cd $1
	mate .
else
	echo "USAGE : new_layout_for [name_of_layout]"
fi	
}

# commits a project and deploys it via capistrano
ci_and_deploy() {
	if [ -n "$1" ]; then
		svn ci -m "$1"
		cap deploy
	else
		echo "USAGE : ci_and_deploy [message for commit]"
	fi
}

# # create a new rails cms project using mephisto based on cms_skeleton structure
# new_rails_cms_project () {
# if [ -n "$1" ]; then
#   echo "Grabbing and copying template over..."
#   svn cp "svn://internal.innerfusion.net/templates/cms_skeleton/" "svn://internal.innerfusion.net/$1" "-m 'Copying rails structure for $1'";
#   echo "Renaming the project to : $1"
#   svn mv "svn://internal.innerfusion.net/$1/trunk/cms_skeleton" "svn://internal.innerfusion.net/$1/trunk/$1" "-m 'renaming the trunk to the appropriate name'";
#   echo "Generating new rails project: $1 ..."
#   echo "Checking out new rails project: $1 ..."
#   svn co "svn://internal.innerfusion.net/$1/trunk/$1"
#   echo "CONGRATULATIONS YOUR NEW CMS APPLICATION : $1 IS READY!"
#   echo "==="
#   echo "Make sure and update the database.yml file before you get started"
#   echo "==="
# else
#   echo "USAGE: new_rails_cms_project [name_of_project]" 
# fi
# }

# create a new rails blog project using simplelog based on cms_skeleton structure
new_rails_blog_project () {
if [ -n "$1" ]; then
	echo "Grabbing and copying template over..."
	svn cp "svn://internal.innerfusion.net/templates/simplelog/" "svn://internal.innerfusion.net/$1" "-m 'Copying rails structure for $1'";
	echo "Renaming the project to : $1"
	echo "Generating new blog project: $1 ..."
	echo "Checking out new blog project: $1 ..."
	svn co "svn://internal.innerfusion.net/$1"
	echo "CONGRATULATIONS YOUR NEW BLOG APPLICATION : $1 IS READY!"
	echo "==="
	echo "INSTALLATION :"
	echo "1. Make sure and update settings in config/server"
	echo "2. run rake simplelog:install"
	echo "3. run ./script/server"
	echo "4. login at : http://localhost:3000/admin with temp@email.com / !@gonow"
	echo "5. create your theme using ./script/generate theme [name_of_theme] (if you have the theme plugin)"
	echo "6. make sure and rename the default layout (which should be default.rhtml) to site.rhtml"
	echo "==="
else
	echo "USAGE: new_rails_blog_project [name_of_project]"	
fi
}

#USAGE svn_cp [src_folder] [dest_folder] [message]
svn_cp (){
	if [ -n "$1" ]; then
		svn cp "svn://internal.innerfusion.net/$1" "svn://internal.innerfusion.net/$2" "-m $3"; 
	else
		echo "USAGE: svn_cp [src_folder] [dest_folder] [message]";
	fi
}

# shortcut for versioning rails plugins in svn
#USAGE tag_rails_plugin [plugin_name] [version] [message] 
tag_rails_plugin(){
	if [ -n "$1" ]; then
		
		svn cp "svn://internal.innerfusion.net/rails/plugins/$1" "svn://internal.innerfusion.net/rails/plugin_libs/$1/tags/$2" "-m $3"; 
	else
		echo "USAGE: tag_rails_plugins [plugin_name] [version] [message]";
	fi
}

#for non-rails stuff
#USAGE svn_tag [repos_version_from] [version] [msg]
svn_tag () { 
	if [ -n "$1" ]; then
		svn cp "svn://internal.innerfusion.net/$1" "svn://internal.innerfusion.net/$1/tags/$2" "-m $3"; 
	else
		echo "USAGE: svn_tag [repos_version_from] [version] [msg]";
	fi	
}

#tagging rails projects -- useful only if you used svnrails to create a rails project
#USAGE tag_rails [repos_version_from] [version] [msg]
tag_rails () {
	if [ -n "$1" ]; then
		svn cp "svn://internal.innerfusion.net/$1/trunk/$1" "svn://internal.innerfusion.net/$1/tags/$2" "-m $3"; 
	else
		echo "USAGE: tag_rails [repos_version_from] [version] [msg]";
	fi
}

#USAGE versions_for [project]
versions_for () {
	if [ -n "$1" ]; then
		svn ls "svn://internal.innerfusion.net/$1/tags/"; 
	else
		echo "Lists svn versions for a project"
		echo "USAGE: versions_for [project]"; 
	fi
}

#USAGE svn_rm [repos_to_remove] [msg]
svn_rm (){ 
	if [ -n "$1" ]; then
		svn rm "svn://internal.innerfusion.net/$1" "-m $2"; 
	else
		echo "USAGE: svn_rm [repos_to_remove] [msg]";
	fi	
}

#USAGE svn_mkdir [dir] [msg]
svn_mkdir (){ 
	if [ -n "$1" ]; then
		svn mkdir "svn://internal.innerfusion.net/$1" "-m $2"; 
	else
		echo "USAGE: svn_mkdir [dir] [msg]";
	fi	
}

#USAGE svn_mv [source] [dest] [msg]
svn_mv (){ 
	if [ -n "$1" ]; then
		svn mv "svn://internal.innerfusion.net/$1" "svn://internal.innerfusion.net/$2" "-m $3"; 
	else
		echo "USAGE: svn_mv [source] [dest] [msg]";
	fi	
}

#USAGE svn_import [file|dir] [path] [msg]
svn_import(){
	if [ -n "$1" ]; then
		svn import $1 "svn://internal.innerfusion.net/$2" -m "$3"
	else
		echo "USAGE svn_import [file|dir] [path] [msg]"
	fi
}	

#USAGE svn_diff [file|dir]
svn-diff(){
	if [ -n "$1" ]; then
		svn diff $1 | colordiff | less -R
	else
    svn diff . | colordiff | less -R
	fi
}

#USAGE svn_log [file|dir] [limit]
svn-log(){
	if [ $# -eq 1 ]; then
		svn log $1 | less | colordiff
	elif [ $# -ge 2 ]; then
		svn log $1 --limit $2 | less | colordiff
	else
		svn log | less | colordiff
	fi
}

svn_rails_log(){
	if [ $# -eq 1 ]; then
		svn log svn://internal.innerfusion.us/$1/trunk/$1 | less
	elif [ $# -ge 2 ]; then
		svn log svn://internal.innerfusion.us/$1/trunk/$1 --limit $2 | less
	else
		svn log | less
	fi
}

# a quick way to install a rails plugin externally from git / github
git_plugin (){
  if [ -n "$1" ]; then
    cd vendor/plugins
    git clone $1
    cd ../../
    echo "==="
    echo "Installed $1 Successfully!"
	else
		echo "USAGE git_plugin [git_repo_address]"
	fi
}

# a direct hook into my github repo, simply pass in the project name and we take
# care of the rest
git_up (){
  if [ -n "$1" ]; then
    git pull git://github.com/vanntastic/$1.git
  else
  	echo "USAGE git_up [project_name]"
  fi
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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
