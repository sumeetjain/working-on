require 'sinatra'
require 'pg'
require 'pry'
require 'csv'
require 'json'
require './services/database.rb'
$database = Database.new
require './services/time_formatter.rb'
require './models/student.rb'
require './models/submission.rb'
require './models/posts.rb'
require './models/post.rb'
require './services/admin.rb'

enable :sessions

require './controller.rb'