set :application, "redwarrior"
set :repository, "git@github.com:m4risU/redwarrior.git"
set :scm, :git
set :scm_user, "m4risu"

set :use_sudo, true
set :deploy_to, "/srv/redwarrior.pl/"

set :keep_releases, 5
after "deploy:update", "deploy:cleanup"

server "redwarrior.pl", :app, :web, :db, :primary => true
set :rails_env, "production"
set :user, "rails"

after "deploy:update", "deploy:copy_yml_files"

deploy.task :copy_yml_files do
  run "ln -s /srv/redwarrior.pl/etc/config/database.yml /srv/redwarrior.pl/current/config/database.yml"
end

deploy.task :bundle do
  #run "cd #{release_path}; sudo bundle install --deployment" if there are git repos!
  run "cd #{release_path}; sudo bundle install"
end

deploy.task :restart, :roles => :app do
  #run "cd /srv/selectsix.bytelion.com/current; sudo bundle update"
  #run "cd /srv/selectsix.bytelion.com/current; bundle exec rake assets:precompile"

  #run "sudo kill -SIGQUIT  `ps aux | grep [r]esque | grep -v grep | cut -c 10-16`"
  #run "sudo god restart resque"
  # separate thin service with wrapper!
  # http://stackoverflow.com/questions/3230404/rvm-and-thin-root-vs-local-user
  #run "sudo service thin_s6 restart"
  run "cd #{release_path}; sudo bundle install"
  run "cd #{release_path}; RAILS_ENV=#{rails_env} sudo bundle exec rake assets:precompile"
  run "sudo service thin_rw restart"
end
