class Post

	def format_admin_post(array_of_posts)
		return_array = []
		array_of_posts.each do |post|
			current_row = post.split(",")
			date = current_row[0].to_i
			date = Time.at(date).strftime('%x %I:%M:%S%p')
			return_array << post
		end
end