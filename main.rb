require 'sinatra'
require 'pry'
require 'csv'
require './services/database.rb'
require './models/student.rb'
require './models/submission.rb'
require './models/posts.rb'

enable :sessions

require './controller.rb'