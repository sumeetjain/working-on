# To install Postgres and the Ruby Postgres adapter:

# brew install postgresql
# gem install pg -- --with-pg-config=/usr/local/bin/pg_config

# -----------------------------------------------------------------------------

# require "pg"

# # # When you need to set up the database, just UNCOMMENT the below.
# # # # Remember to comment it back out when you're done.

# # conn = PG.connect( dbname: 'postgres' )
# # conn.exec("CREATE DATABASE working_on_development")
# # conn.exec("CREATE DATABASE working_on_test")

# conn = PG.connect( dbname: 'working_on_development' )

# And create tables...
# conn.exec("CREATE TABLE submissions (
#   date        VARCHAR(8), 
#   time        VARCHAR(30), 
#   interval    VARCHAR(30), 
#   name        VARCHAR(255), 
#   stressLevel INTEGER, 
#   submission  TEXT
# )")

# To instantiate the table for students, include line 17, and line 8

# conn.exec("CREATE TABLE students (
# 	id SERIAL PRIMARY KEY,
# 	name VARCHAR(128)
# )")
