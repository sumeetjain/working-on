# Contains all functionality relating to formatting individual posts.

class Post

	# Initializes the Post class with an inputted Array of posts.
	def initialize(array_of_posts)
		@posts = array_of_posts
	end

	# Formats posts for the front page.
	#
	# Returns an Array of formatted posts.
	def format_post_front_page
		post_array = []
		@posts.each do |post|
			formatted_time = post[0].to_i
			formatted_time = Time.at(formatted_time).strftime("%m/%d @ %I:%M%p")
			post_array.push([post[2],formatted_time,post[4]])
		end
		return post_array
	end

	# Formats posts for the admin page.
	#
	# Returns an Array of formatted posts.
	def format_post_admin_page
		post_array = []
		@posts.each do |post|
			formatted_time = post[0].to_i
			formatted_time = Time.at(formatted_time).strftime("%x %I:%M:&S%p")
			post_array.push([post[2], formatted_time, post[1], post[3], post[4]])
		end
		return post_array
	end
end