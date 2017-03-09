# This class is for functionality related to ALL of a student's posts for a
# particular day. That is, one object/instance of this class is ALL of a 
# student's posts for one day.

# Contains all functionality relating to groupings of posts.

class Posts

	# Initialize based on the requested search parameters (student posts by date)
	def initialize(params)
		@student = params[:student]
		@day = params[:day]
	end

	# Splits array of posts passed in as array of strings into 2D array.
	def split_post_strings(posts)
		split_posts = []
		posts.each do |post|
			post = post.split(",")
			split_posts << post
		end
		return split_posts
	end

	# Grabs requested posts based on the search parameters entered (student posts by date)
	#
	# Returns an Array of row strings containing requested posts.
	def get_search_posts
		names = get_requested_posts_by_name
		posts = get_requested_posts_by_date(names)
	end

	###
	def hold_posts
		posts = get_search_posts
		post_holder = []
			posts.each do |post|
			post_holder << Post.new(post)
			end
			return post_holder
	end	

	###
	def front_page_json(posts)
      post_array = []
      posts.each do |post|
      	formatted_time = Time.at(post["time"].to_i).strftime("%m/%d @ %I:%M%p")
      	json_post = post["name"] + "," + formatted_time + "," + post["submission"]
      	post_array << json_post
      end
      binding.pry
      return post_array.to_json
    end

	private

	# Get all posts of the requested student.
	def get_requested_posts_by_name
		posts = $database.all_by("name", @student)
	end

	# Get all of the students' posts from the requested date.
	#
	# Returns an Array of row strings containing requested posts.
	def get_requested_posts_by_date(posts)
		requested_posts = []
		posts.each do |post|
			post_day = post["time"].to_i
			post_day = Time.at(post_day).strftime("%D")
			if post_day == @day
				requested_posts << post
			end
		end
		return requested_posts
	end
end