class Post

	def initialize(array_of_posts)
		@posts = array_of_posts
	end

	def format_post_front_page
		post_array = []
		@posts.each do |post|
			formatted_time = post[0].to_i
			formatted_time = Time.at(formatted_time).strftime("%m/%d @ %I:%M%p")
			post_array.push([post[2],formatted_time,post[4]])
		end
		return post_array
	end

	def format_admin_page_post
		post_array = []
		@posts.each do |post|
			formatted_time = post[0].to_i
			formatted_time = Time.at(formatted_time).strftime("%x %I:%M:&S%p")
			post_array.push(post[2] + formatted_time + post[1] + post[3] + post[4])
		end
		return post_array
	end
end