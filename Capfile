#!/usr/bin/ruby

load 'deploy'

set :application, "fluffbox-rwx"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "capistrano_rsa")] 

default_run_options[:pty] = true

# DEPLOYMENT SCHEME
set :scm, :none
set :deploy_via, :copy
set :repository do
  fetch(:deploy_from)
end

# LOCAL
set :war, "/Users/mstine/.hudson/jobs/Fluffbox-RWX/workspace/target/fluffbox-rwx-0.1.war"

# TOMCAT SERVERS
role :webserver, "localhost"
set :tomcat_home, "/Users/mstine/Tools/tomcat/"
set :tomcat_ctrl, "/Users/mstine/Tools/tomcat/bin"

# USER / SHELL
set :user, "mstine" # the user to run remote commands as
set :use_sudo, false

set :deploy_from do
  dir = "/tmp/prep_#{release_name}"
  system("mkdir -p #{dir}")
  dir
end

# this is capistrano's default location.
# depending on the permissions of the server
# you may need to create it and chown it over
# to :user (e.g. chown -R robotuser:robotuser /u)
set :deploy_to do
  "/u/apps/#{application}"
end

#
# simple interactions with the tomcat server
#
namespace :tomcat do

  desc "start tomcat"
  task :start do
    system "nohup #{tomcat_ctrl}/startup.sh"
  end

  desc "stop tomcat"
  task :stop do
    system "#{tomcat_ctrl}/shutdown.sh"
  end

  desc "stop and start tomcat"
  task :restart do
    tomcat.stop
    tomcat.start
  end

  desc "tail :tomcat_home/logs/*.log and logs/catalina.out"
  task :tail do
    stream "tail -f #{tomcat_home}/logs/*.log #{tomcat_home}/logs/catalina.out"
  end

end

#
# link the current/whatever.war into our webapps/whatever.war
#
after 'deploy:setup' do
  cmd = "ln -sf #{deploy_to}/current/`basename #{war}` #{tomcat_home}/webapps/`basename #{war}`"
  puts cmd
  system cmd
end

# collect up our war into the deploy_from folder
# notice that all we're doing is a copy here,
# so it is pretty easy to swap this out for
# a wget command, which makes sense if you're
# using a continuous integration server like
# bamboo. (more on this later).
before 'deploy:update_code' do
  unless(war.nil?)
    puts "get war"
    system("cp #{war} #{deploy_from}")
    puts system("ls -l #{deploy_from}")
  end
end

# restart tomcat
namespace :deploy do
  task :restart do
    tomcat.start
  end
end

before 'deploy:symlink' do
  tomcat.stop
  sleep 10
end

def getDeploymentStatus
  output = `wget -O - http://localhost:8081/fluffbox-rwx-0.1 | grep "Easy NFJS Speaker Rentals" | wc -l`
  status = output.strip
end 

after 'deploy:restart' do
  status = getDeploymentStatus

  tries = 0
  loop do
    if status == "1"
      puts "Deployment Success!"
      exit
    elsif status == "0"
      tries += 1
      puts "Application still down after #{tries} tries!"

      if tries == 10 #After 90 seconds we're considering the deployment a failure
        raise RuntimeError, 'Deployment Failure!'
      end  

      sleep 10  
      status = getDeploymentStatus
    end
  end
end

#
# Disable all the default tasks that
# either don't apply, or I haven't made work.
#
namespace :deploy do
  [ :upload, :cold, :start, :stop, :migrate, :migrations ].each do |default_task|
    desc "[internal] disabled"
    task default_task do
      # disabled
    end
  end

  namespace :web do
    [ :disable, :enable ].each do |default_task|
      desc "[internal] disabled"
      task default_task do
        # disabled
      end
    end
  end

  namespace :pending do
    [ :default, :diff ].each do |default_task|
      desc "[internal] disabled"
      task default_task do
        # disabled
      end
    end
  end
end
