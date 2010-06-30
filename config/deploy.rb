set :application, "sadhana"
set :repository,  "git://github.com/lperichon/sadhana.git"
set :scm, "git"
set :branch, "master"
set :domain, "66.84.0.147"
set :user, "variete"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :chmod755, %w(app config db public vendor script tmp public/dispatch.cgi public/dispatch.fcgi public/dispatch.rb)
set :use_sudo, false
default_run_options[:pty] = true

role :web, domain
role :app, domain
role :db,  domain, :primary => true

task :production do
set :rails_env, :production
set :deploy_to, "/home/#{user}/apps/#{application}"

after "deploy:symlink", "deploy:copy_files"
end

task :staging do
set :rails_env, :staging
set :deploy_to, "/home/#{user}/apps/#{application}-staging"

after "deploy:symlink", "deploy:copy_staging_files"
end

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Set the proper permissions for directories and files on HostingRails accounts"
  after :deploy do
    run(chmod755.collect do |item|
      "chmod 755 #{current_path}/#{item}"
    end.join(" && "))
  end

  task :copy_production_files do
    run "cp -pf #{deploy_to}/to_copy/.rvmrc #{current_path}/.rvmrc"
    run "cp -pf #{deploy_to}/to_copy/database.yml #{current_path}/config/database.yml"
    run "cp -pf #{deploy_to}/to_copy/production.rb #{current_path}/config/environments/production.rb"
  end

  task :copy_staging_files do
    run "cp -pf #{deploy_to}/to_copy/.rvmrc #{current_path}/.rvmrc"
    run "cp -pf #{deploy_to}/to_copy/database.yml #{current_path}/config/database.yml"
    run "cp -pf #{deploy_to}/to_copy/staging.rb #{current_path}/config/environments/staging.rb"
  end
end