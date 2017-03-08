# Contains all functionality relating to formatting individual posts.

class Post

	# Initializes the Post class with a requested Array of posts.
  #
  # With current functionality, this will be either all of today's posts or posts by student on a certain day.
	def initialize(post)	
	@post = post
	end

	def date
		@post["date"]
	end

	def time
		@post["time"]
	end

	def interval
		@post["interval"]
	end

	def name
		@post["name"]
	end

	def stressLevel
		@post["stressLevel"]
	end

	def submission
		@post["submission"]
	end

	# Formats posts for the front page.
	#
	# Returns a two-dimensional Array of formatted posts.
	# def format_post_front_page
	# 	post_array = []
	# 	@posts.each do |post|
	# 		post = post.split(",")
	# 		formatted_time = post[1].to_i
	# 		formatted_time = Time.at(formatted_time).strftime("%m/%d @ %I:%M%p")
	# 		post_array.push([post[3],formatted_time,post[5]])
	# 	end
	# 	return post_array
	# end

	# Formats posts for the admin page.
	#
	# Returns a two-dimensional Array of formatted posts.
	# def format_post_admin_page
	# 	post_array = []
	# 	@posts.each do |post|
	# 		formatted_time = post[1].to_i
	# 		formatted_time = Time.at(formatted_time).strftime("%x %I:%M%p")
	# 		post_array.push([post[3], formatted_time, post[2], post[4], post[5]])
	# 	end
	# 	return post_array
	# end
end