# Sets 'index.erb' as the homepage.
#
# Sets @login session variable to store student's name for repeat visits.
get "/" do
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

	@dailyPosts = Posts.a_days_post_info

  # TODO Move all DB functionality into a model/service, e.g.:
  # @dailyPosts = Post.today
  
	@dailyPosts.to_json
end

# Sends these params into the Posts class to grab the requested posts for display.
#
# Sends admin to getinfo page with their selected search params.
get "/getinfo" do
	@info = Posts.new
	@info = @info.sort_by_date(params[:day],params[:name])
  erb :getinfo
end