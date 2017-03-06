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

# Front page display, gets all posts for current day and formats correctly.
get "/display" do
<<<<<<< HEAD

	@dailyPosts = $database.posts_today

  # TODO Move all DB functionality into a model/service, e.g.:
  # @dailyPosts = Post.today
  
	@dailyPosts.to_json
=======
	dailyPosts = $database.all
	todays_posts = Posts.new({:day=>Time.now.strftime("%D")}).get_requested_posts_by_date(dailyPosts)
	@return_posts = Post.new(todays_posts).format_post_front_page
	@return_posts.to_json
>>>>>>> ead174af7c5c9b987feadb2e83f59e8cf2c5301f
end

# Sends these params into the Posts class to grab the requested posts for display.
#
# Sends admin to getinfo page with their selected search params.
get "/getinfo" do
<<<<<<< HEAD
	@info = Posts.new(params)
	@info = @info.get_posts_by_date
  erb :getinfo
=======
	@names = Submission.names
  	@dates = Submission.dates
	posts = Posts.new(params)
	names = posts.get_requested_posts_by_name
	posts = posts.get_requested_posts_by_date(names)
  	@info = Post.new(posts).format_post_admin_page
  	erb :getinfo, :layout => :admin_layout
>>>>>>> ead174af7c5c9b987feadb2e83f59e8cf2c5301f
end