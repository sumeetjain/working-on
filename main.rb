require 'sinatra'
require 'pry'
require './functions.rb'

enable :sessions

get "/" do
	erb :index
end

post "/submit" do
	binding.pry
	storeInformation(params)
	redirect("/display")
end

get "/display" do
	@submissions = displayInformation()
	erb :display
end