# Sets 'index.erb' as the homepage.
#
# Sets @login session variable to store student's name for repeat visits.
get "/" do
	@login = session["login"]
	erb :index
end

# Temporary controller. Reserts the login session variable for testing.
get "/reset" do
	session.delete("login")
	erb :index
end

# Sends user submission info as params to the Submission class.
#
# Redirects back to homepage.
post "/submit" do
	session["login"] = params["name"]
  	submission = Submission.new
  	submission.create(params)
  	redirect("/")
end

# Loads the admin page.
#
# Builds dropdown menus of available student names and dates using the Submission class.
get "/admin" do
	@names = Submission.names
  	@dates = Submission.dates
  	erb :admin, :layout => :admin_layout
end

get "/display" do
	@dailyPosts = $database.posts_today

  # TODO Move all DB functionality into a model/service, e.g.:
  # @dailyPosts = Post.today
  
	@dailyPosts.to_json
end

# Sends these params into the Posts class to grab the requested posts for display.
#
# Sends admin to getinfo page with their selected search params.
get "/getinfo" do
	@names = Submission.names
  	@dates = Submission.dates
	@info = Posts.new(params)
	@info = @info.get_posts_by_date
  	erb :getinfo, :layout => :admin_layout
end