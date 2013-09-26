$:.unshift './lib'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

require 'mina/defaults'
require 'mina/extras'
require 'mina/god'
require 'mina/unicorn'
require 'mina/nginx'

Dir['lib/mina/servers/*.rb'].each { |f| load f }

###########################################################################
# Common settings for all servers
###########################################################################

set :repository,         'git@github.com:marshluca/timeline.git'
set :keep_releases,       99
set :default_server,     'development'

###########################################################################
# Tasks
###########################################################################

set :server, ENV['to'] || default_server
invoke :"env:#{server}"

namespace :faye do
  desc "Start faye server"
  task :start do
    queue %[cd #{deploy_to!}/current/faye && bundle exec thin start -C thin.yml]
  end

  desc "Stop faye server"
  task :stop do
    queue %[cd #{deploy_to!}/current/faye && bundle exec thin stop -C thin.yml]
  end

  desc "Restart faye server"
  task :restart do
    queue %[cd #{deploy_to!}/current/faye && bundle exec thin restart -C thin.yml]
  end
end

desc "Shows logs."
task :log do
  queue %[cd #{deploy_to!}/current && tail -f log/production.log]
end

desc "Shows logs."
task :seed do
  queue %[cd #{deploy_to!}/current && RAILS_ENV=production bundle exec rake db:seed]
end

desc "Deploys the current version to the server."
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      invoke :'unicorn:restart'
      # invoke :'faye:restart'
    end
  end
end
