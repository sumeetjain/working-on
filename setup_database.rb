# To install Postgres and the Ruby Postgres adapter:

# brew install postgresql
# gem install pg -- --with-pg-config=/usr/local/bin/pg_config

# -----------------------------------------------------------------------------

require "pg"
require "uri"

# When you need to set up the database, just UNCOMMENT the below.
# Remember to comment it back out when you're done.

if ENV['DATABASE_URL']
  uri = URI.parse(ENV['DATABASE_URL'])
  conn = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
else
  conn = PG.connect( dbname: 'postgres' )
  conn.exec("CREATE DATABASE working_on_development")
  conn.exec("CREATE DATABASE working_on_test")

  conn = PG.connect( dbname: 'working_on_development' )
end

# And create tables...

conn.exec("CREATE TABLE submissions (
  date        VARCHAR(8), 
  time        VARCHAR(30), 
  interval    VARCHAR(30), 
  stressLevel INTEGER, 
  submission  TEXT,
  id          INTEGER
)")

conn.exec("CREATE TABLE students (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
  github VARCHAR(20),
  password VARCHAR(20)
)")

conn.exec("CREATE TABLE admin (
  username    VARCHAR(10), 
  password    VARCHAR(20)
)")