require 'sinatra'
require 'pry'
require './functions.rb'
require 'csv'
require './services/database.rb'
require './models/submission.rb'

enable :sessions

get "/" do
	erb :index
end

post "/submit" do
  submission = Submission.new
  submission.create(params)
	redirect("/display")
end

get "/display" do
	@submissions = displayInformation()
	erb :display
end