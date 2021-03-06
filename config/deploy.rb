# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, 'freemarket_sample_49a'
set :repo_url,  'git@github.com:1ruru/freemarket_sample_49a.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push("config/master.key")

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/freemarcket_key_pair.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
set :default_env,{
  BASIC_AUTH_USER: ENV["BASIC_AUTH_USER"],
  BASIC_AUTH_PASSWORD: ENV["BASIC_AUTH_PASSWORD"],
  RECAPTCHA_SITE_KEY: ENV['RECAPTCHA_SITE_KEY'],
  RECAPTCHA_SECRET_KEY: ENV['RECAPTCHA_SECRET_KEY']
}
end