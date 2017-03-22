database_needs_to_be_setup = true

if database_needs_to_be_setup
  require_relative "./setup_database.rb"
end

require './main'
run Sinatra::Application