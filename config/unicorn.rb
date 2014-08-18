APP_PATH = "/var/www/blog"
working_directory APP_PATH
pid APP_PATH+"/tmp/pids/unicorn.pid"
stderr_path APP_PATH+"/log/unicorn.log"
stdout_path APP_PATH+"/log/unicorn.log"

listen "/tmp/unicorn.todo.sock"
worker_processes 2
timeout 30
