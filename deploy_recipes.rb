namespace :jprecipes do
  
  desc "Creates Shared/Config and database.yml"
  task :setup_production_database_configuration do
    mysql_password = Capistrano::CLI.password_prompt("Production MySQL  password: ")

    require 'yaml'
    spec = { 
      "development" => {
        "adapter" => "mysql",
        "database" => "mertd_development",
        "username" => user,
        "password" => mysql_password,
        "encoding" => "UTF8",
        "socket" => "/var/run/mysqld/mysqld.sock"
      }, 

      "test" => {
        "adapter" => "mysql",
        "database" => "mertd_test",
        "username" => user,
        "password" => mysql_password,
        "encoding" => "UTF8",
        "socket" => "/var/run/mysqld/mysqld.sock"
      },

      "production" => {
        "adapter" => "mysql",
        "database" => "mertd_production",
        "username" => user,
        "password" => mysql_password,
        "encoding" => "UTF8",
        "socket" => "/var/run/mysqld/mysqld.sock"
      } 
    }

    run "mkdir -p #{shared_path}/config"
    put(spec.to_yaml, "#{shared_path}/config/database.yml")
  end
  after "deploy:setup", "jprecipes:setup_production_database_configuration"
  
  desc "Copy Config Files"
  task :copy_config_files do
    run "cp #{shared_path}/config/* #{release_path}/config/"
  end
  after "deploy:update_code", "jprecipes:copy_config_files"
  
  desc "Delete the Main folder"
  task :delete_main_folder do
    run "rm -r /home/#{user}/www/#{application}"
  end
  
  desc "Start Nginx"
  task :start_nginx do
    sudo "/etc/init.d/nginx start"
  end
  
  desc "Stop Nginx"
  task :stop_nginx do
    run "/etc/init.d/nginx stop"
  end
  
  desc "restart Nginx"
  task :restart_nginx do
    stop_nginx
    start_nginx
  end
  
  desc "read production log"
  task :p_log do
    run "cat /home/#{user}/www/#{application}/current/log/production.log"
  end
  
end
