require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
# require 'mina/rvm'    # for rvm support. (http://rvm.io)
require 'mina/unicorn'
# require 'mina_sidekiq/tasks'
# require 'mina/whenever'
require 'pry'
# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, '139.162.57.116'
set :rails_env, 'production'
set :rack_env, 'production'
set :deploy_to, '/home/deployer/apps/bharatresource'
set :repository, 'git@github.com:hardikg2312/bharatresource.git'
set :user, 'deployer'
set :forward_agent, true
# set :port, '22'
set :ssh_options, '-A'
set :branch, 'master'

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log',"config/app_config.yml","config/secrets.yml","public/uploads",".env","tmp"]
set :unicorn_pid, "#{deploy_to}/current/tmp/pids/unicorn.pid"
set :unicorn_env, 'production'
# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
  queue %{
    echo "-----> Loading environment"
    #{echo_cmd %[source ~/.bashrc]}
    }
  # invoke :'rvm:use[ruby-2.2.2]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]

  queue! %[touch "#{deploy_to}/shared/config/secrets.yml"]
  queue %[echo "-----> Be sure to edit 'shared/config/secrets.yml'."]

  queue! %[touch "#{deploy_to}/shared/config/app_config.yml"]
  queue %[echo "-----> Be sure to edit 'shared/config/app_config.yml'."]

  queue! %[mkdir -p "#{deploy_to}/shared/pids/"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/pids"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/pids/"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets/"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/"]
    queue! %[mkdir -p "#{deploy_to}/shared/sockets/"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/sockets"]

  queue! %[mkdir -p "#{deploy_to}/shared/public/uploads"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/public/"]

end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    # invoke :'sidekiq:quiet'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'
    
    
    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      invoke :'unicorn:restart'
      # invoke :'whenever:update'
      # invoke :'unicorn:restart'
      #  invoke :'sidekiq:restart'
    end
  end
end