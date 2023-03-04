rm tmp/pids/server.pid

DB_ENV=${DB_ENV} rails s -b 0.0.0.0 -p ${PORT}