require 'mina/git'
require 'mina/bundler'

set :domain, 'hennevogel.de'
set :deploy_to, '/srv/www/vhosts/hennevogel.de/landing'
set :repository, 'https://github.com/hennevogel/hennevogel.de.git'
set :branch, 'master'
set :user, 'hvogel'

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
end

# Put any custom mkdir's in here for when `mina setup` is ran.
task :setup => :environment do
end

task :build do
  queue 'JEKYLL_ENV=production bundle exec jekyll build'
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'bundle:install'
    invoke :build
  end
end
