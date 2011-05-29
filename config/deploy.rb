set :application, "jdrampage"
 
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/jdrampage"
 
# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :repository, "git@github.com:dmonopoly/jdrampage.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :use_sudo, false
set :user, 'jdrampage'
set :ssh_options, { :forward_agent => true }
 
role :app, "jdrampage.com"
role :web, "jdrampage.com"
role :db,  "jdrampage.com", :primary => true
 
namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end