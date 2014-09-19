# config valid only for Capistrano 3.1
SSHKit.config.command_map[:rake] = 'bundle exec rake'

lock '3.2.1'

set :application, 'ruby-brightideas'
set :repo_url, 'git@github.com:SBS-team/brightideas.git'
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
set :scm, :git

set :rvm_type, :user

set :rvm_ruby_version, 'ruby-2.1.2@ideas'

set :user, 'deployer'
set :deploy_to, "/home/deployer/#{fetch(:stage)}/brightideas"

set :deploy_via, :remote_cache

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []

set :linked_files, %w{config/database.yml .env config/unicorn.rb}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :unicorn_conf, "#{fetch(:deploy_to)}/current/config/unicorn.rb"
set :unicorn_pid, "#{fetch(:deploy_to)}/shared/tmp/pids/unicorn.pid"

# Default value for default_env is {}
set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

namespace :deploy do
  task :restart do
    on 'deployer@192.168.137.75' do
      execute "if [ -f #{fetch(:unicorn_pid)} ] && [ -e /proc/$(cat #{fetch(:unicorn_pid)}) ]; then kill -USR2 `cat #{fetch(:unicorn_pid)}`; else cd #{fetch(:deploy_to)}/current && bundle exec unicorn -c #{fetch(:unicorn_conf)} -E #{fetch(:rails_env)} -D; fi"
    end
  end

  task :start do
    on roles [:web, :app] do
      within "#{fetch(:deploy_to)}/current" do
        execute :bundle,:exec, "unicorn -c #{fetch(:unicorn_conf)} -E #{fetch(:rails_env)} -D"
      end
    end
  end

  task :stop do
    on 'deployer@192.168.137.75' do
      execute "if [ -f #{fetch(:unicorn_pid)} ] && [ -e /proc/$(cat #{fetch(:unicorn_pid)}) ]; then kill -QUIT `cat #{fetch(:unicorn_pid)}`; fi"
    end
  end

  task :reset do
    run "cd #{current_path} && bundle exec rake db:reset RAILS_ENV=#{rails_env}"
  end
end

after('deploy:restart', 'deploy:cleanup')

