app_root = File.expand_path('../../../shared', __FILE__)

pidfile "#{app_root}/tmp/pids/puma.pid"
state_path "#{app_root}/tmp/pids/puma.state"
bind "unix://#{app_root}/tmp/sockets/puma.sock"
activate_control_app "unix://#{app_root}/tmp/sockets/pumactl.sock"

daemonize true

workers ENV.fetch('PUMA_WORKERS_COUNT',2).to_i
threads ENV.fetch('PUMA_THREADS_MIN',8).to_i, ENV.fetch('PUMA_THREADS_MAX',16).to_i
preload_app!

stdout_redirect "#{app_root}/log/puma_access.log", "#{app_root}/log/puma_error.log", true

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end
