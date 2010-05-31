set :application, "sadhana"
set :repository,  "git://github.com/lperichon/sadhana.git"

set :scm, "git"

set :branch, "master"

set :domain, "66.84.0.147"
set :user, "variete"
set :rails_env, :production
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :chmod755, %w(app config db public vendor script tmp public/dispatch.cgi public/dispatch.fcgi public/dispatch.rb)
set :use_sudo, false
default_run_options[:pty] = true

role :web, domain
role :app, domain
role :db,  domain, :primary => true

after "deploy:symlink", "deploy:copy_files"

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Set the proper permissions for directories and files on HostingRails accounts"
  task :after_deploy do
    run(chmod755.collect do |item|
      "chmod 755 #{current_path}/#{item}"
    end.join(" && "))
  end

  task :copy_files do
    run "cp -pf #{deploy_to}/to_copy/.rvmrc #{current_path}/.rvmrc"
    run "cp -pf #{deploy_to}/to_copy/database.yml #{current_path}/config/database.yml"
  end
end