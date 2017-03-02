# displays index.erb the mainpaige of the website

get "/" do
	@login = session["login"]
	erb :index
end

# session["login"] creates a cookie that will keep track of the user.  Creates a new submission
# class object, and adds the value set (params) gotten from /submit


post "/submit" do
	session["login"] = params["name"]
  	submission = Submission.new
  	submission.create(params)
  	redirect("/display")
end

get "/display" do
  	@names = Submission.names
  	@dates = Submission.dates
  	binding.pry
end

get "/admin" do
	@names = Submission.names
  	@dates = Submission.dates
  	erb :admin
end

get "/getinfo" do
	@info = Posts.new(params)
	@info = @info.get_posts_by_date
  	erb :getinfo
end