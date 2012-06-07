set :application, "jsblogger_advanced"
set :repository,  "git@github.com:wengzilla/jsblogger_advanced.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :port, `vagrant ssh-config | grep Port | awk '{ print $2 }'`
set :deploy_to, "/vagrant/jsblogger_advanced"
role :web, "10.10.10.10"
role :app, "10.10.10.10"
role :db,  "10.10.10.10", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end