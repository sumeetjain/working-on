# Sets 'index.erb' as the homepage.
#
# Sets @login session variable to store student's name for repeat visits.
get "/" do
	@login = session["login"]
	erb :index
end

# Deletes login session variable.
get "/reset" do
	session.delete("login")
	erb :index
end

# Collects the student's post information and adds it to the database.
#
# Redirects back to homepage.
post "/submit" do
	session["login"] = params["name"]
	submission = Submission.new
	submission.create(params)
	redirect("/")
end

get "/admin_login" do
	erb :admin_login
end

post "/admin_login" do
	login_status = Admin.new(params).check_valid_login
	binding.pry
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
#
# Through JavaScript this controller runs on page load and every 10 seconds to refresh the page content.
# 
# Post content is returned to JavaScript as JSON through an AJAX request.
get "/display" do
	dailyPosts = $database.all_by("date", Time.now.strftime("%D"))
	@return_posts = Post.new(dailyPosts).format_post_front_page
	@return_posts.to_json
end

# For admin, gets all posts based on requested search params (student name by date).
#
# Loads getinfo page with the selected search posts.
get "/getinfo" do
	@names = Submission.names
  	@dates = Submission.dates
	posts = Posts.new(params)
	names = posts.get_requested_posts_by_name
	posts = posts.get_requested_posts_by_date(names)
  	@info = Post.new(posts).format_post_admin_page
  	erb :getinfo, :layout => :admin_layout
end