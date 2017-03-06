require 'sinatra'
require 'pry'
require 'csv'
require 'json'
require './services/database.rb'

$database = Database.new

require './services/time_formatter.rb'
require './models/student.rb'
require './models/submission.rb'
require './models/posts.rb'

enable :sessions

require './controller.rb'