# Sets 'index.erb' as the homepage.
#
# Sets @login session variable to store student's name for repeat visits.
get "/" do
  @dailyPosts = Database.new.posts_today

	@login = session["login"]
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
  erb :admin
end

get "/display" do
  data = Database.new
  @submissions_today = data.posts_today
end 

# Sends these params into the Posts class to grab the requested posts for display.
#
# Sends admin to getinfo page with their selected search params.
get "/getinfo" do
	@info = Posts.new(params)
	@info = @info.get_posts_by_date
  erb :getinfo
end