require 'sinatra'
require 'pry'
require 'csv'
require './services/database.rb'
require './models/submission.rb'

enable :sessions

require './controller.rb'