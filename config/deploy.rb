set :application, "redwarrior"
set :repository, "git@github.com:m4risU/redwarrior.git"
set :scm, :git
set :scm_user, "m4risu"

set :use_sudo, false
#set :deploy_to, "/srv/redwarrior.pl/"
set :deploy_to, "/home/rails/redwarrior/"

set :keep_releases, 5
after "deploy:update", "deploy:cleanup"

#server "5.9.31.163", :app, :web, :db, :primary => true
server "redwarrior.pl", :app, :web, :db, :primary => true

set :rails_env, "production"
set :user, "rails"

set :default_environment, {
    'PATH' => "/home/rails/.rvm/gems/ruby-1.9.3-p125@redwarrior/bin:/home/rails/.rvm/gems/ruby-1.9.3-p125@global/bin:/home/rails/.rvm/rubies/ruby-1.9.3-p125/bin:/home/rails/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games",
    'GEM_HOME' => '/home/rails/.rvm/gems/ruby-1.9.3-p125@redwarrior',
    'GEM_PATH' => '/home/rails/.rvm/gems/ruby-1.9.3-p125@redwarrior:/home/rails/.rvm/gems/ruby-1.9.3-p125@global',
    'BUNDLE_PATH' => ''
}

after "deploy:update", "deploy:copy_yml_files"
after "deploy:update", "deploy:rvm_init"
after "deploy:rvm_init", "deploy:bundle"
before "deploy:restart", "deploy:bundle"

deploy.task "rvm_init" do
  run "cd #{release_path}; echo 'rvm use 1.9.3-p125@redwarrior' > #{release_path}/.rvmrc"
  #run "cd #{release_path}; gem env"
end

deploy.task :copy_yml_files do
  run "ln -s /home/rails/redwarrior/etc/config/database.yml /home/rails/redwarrior/current/config/database.yml"
  run "ln -s /home/rails/wordpress_redwarrior/current /home/rails/redwarrior/current/public/blog"
end

deploy.task :bundle do
  #run "cd #{release_path}; sudo bundle install --deployment" if there are git repos!
  run "cd #{release_path}; bundle install --path /home/rails/.rvm/gems/ruby-1.9.3-p125@redwarrior"
  #run "cd #{release_path}; bundle update" #" --path /home/rails/.rvm/gems/ruby-1.9.3-p125@redwarrior"
end

deploy.task :restart, :roles => :app do
  #run "cd /srv/selectsix.bytelion.com/current; sudo bundle update"
  #run "cd /srv/selectsix.bytelion.com/current; bundle exec rake assets:precompile"

  #run "sudo kill -SIGQUIT  `ps aux | grep [r]esque | grep -v grep | cut -c 10-16`"
  #run "sudo god restart resque"
  # separate thin service with wrapper!
  # http://stackoverflow.com/questions/3230404/rvm-and-thin-root-vs-local-user
  #run "sudo service thin_s6 restart"
  run "cd #{release_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
  run "sudo service redwarrior restart"
end
