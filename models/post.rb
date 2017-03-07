# Contains all functionality relating to formatting individual posts.

class Post

	# Initializes the Post class with an inputted Array of posts.
	def initialize(array_of_posts)
		@posts = array_of_posts
	end

  # Get all of today's posts.
	# 
	# Returns an Array of posts.
	def Post.today
	    today_filter = Proc.new {|row| Time.at(row["time"].to_i).yday == Time.now.yday}
	    rows = $database.all_filtered(today_filter)
	    rows = rows.map {|row| row.split(",")}
	    rows = rows.each {|arr| arr[0] = Time.at(arr[0].to_i).strftime("%D")}
	    return rows
	end

	# Formats posts for the front page.
	#
	# Returns an Array of formatted posts.
	def format_post_front_page
		post_array = []
		@posts.each do |post|
			post = post.split(",")
			formatted_time = post[1].to_i
			formatted_time = Time.at(formatted_time).strftime("%m/%d @ %I:%M%p")
			post_array.push([post[3],formatted_time,post[5]])
		end
		return post_array
	end

	# Formats posts for the admin page.
	#
	# Returns an Array of formatted posts.
	def format_post_admin_page
		post_array = []
		@posts.each do |post|
			formatted_time = post[1].to_i
			formatted_time = Time.at(formatted_time).strftime("%x %I:%M%p")
			post_array.push([post[3], formatted_time, post[2], post[4], post[5]])
		end
		return post_array
	end
end