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

	# Grabs requested posts based on the search parameters entered (student posts by date)
	#
	# Returns an Array of row strings containing requested posts.
	def get_search_posts
		names = get_requested_posts_by_name
		posts = get_requested_posts_by_date(names)
	end

	# Creates an Array of new Post Objects 
	#
	# Returns an Array of Post Objects
	def hold_posts
		posts = get_search_posts
		post_holder = []

		posts.each do |post|
			post_holder << post
		end

		return post_holder
	end	

	# Creates an Array, splits up posts, modifies the "time" section of posts,
	# concatinates it all into a string.  This string is shoved into the array
	# and put into JSON format.
	#
	# returns an AJAX request.  
	def Posts.front_page_json
			posts = $database.all_by("submissions", "date", Time.now.strftime("%D"))

      post_array = []
      posts.each do |post|
      	post_array << Post.new(post)
      end

      return post_array.map { |post_object| post_object.to_string }.to_json
  end

	private

	# Get all posts of the requested student.
	def get_requested_posts_by_name

		# 1. Get Student's ID for "name"
		# 2. Get all submission for that ID.
		student = Student.new(@student)

		student_id = student.getKey

		posts = $database.all_by("submissions", "id", student_id)

    post_array = []
    posts.each do |post|
    	post_array << Post.new(post)
    end
    return post_array
	end

	# Get all of the students' posts from the requested date.
	#
	# Returns an Array of row strings containing requested posts.
	def get_requested_posts_by_date(posts)
		requested_posts = []
		posts.each do |post|
			post_day = post.time.to_i
			post_day = Time.at(post_day).strftime("%D")
			if post_day == @day
				requested_posts << post
			end
		end
		return requested_posts
	end
end