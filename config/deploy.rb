lock '3.11.0'

set :application, 'poc-backend'
set :repo_url, 'git@github.com:fbalarini/poc-backend.git'
set :user, 'ubuntu'
set :rbenv_ruby, '2.5.1'

set :puma_bind, 'tcp://0.0.0.0:9292'
