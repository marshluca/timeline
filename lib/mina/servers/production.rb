# FreeBSD
namespace :env do
  task :production => [:environment] do
    set :app,              'timeline'
    set :branch,              'develop'
    set :domain,              '192.168.1.14'
    set :deploy_to,           '/home/deploy/www/timeline'
    set :sudoer,              'deploy'
    set :user,                'deploy'
    set :group,               'deploy'
    # set :rvm_path,          '/usr/local/rvm/scripts/rvm'   # we don't use that. see below.
    set :services_path,       '/etc/init.d'          # where your God and Unicorn service control scripts will go
    set :nginx_path,          '/etc/nginx'
    set :deploy_server,       'production'                   # just a handy name of the server
    invoke :defaults                                         # load rest of the config
    invoke :'rbenv:load'
    # invoke :"rvm:use[#{rvm_string}]"                       # since my prod server runs 1.9 as default system ruby, there's no need to run rvm:use
  end
end
