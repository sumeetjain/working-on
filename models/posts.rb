# This class is for functionality related to ALL of a student's posts for a
# particular day. That is, one object/instance of this class is ALL of a 
# student's posts for one day.

class Posts
	# Initialize based on the requested search parameters (student posts by date)
	def initialize(params)
		@student = params[:student]
		@day = params[:day]
	end

	# Get all posts of the requested student.
	def get_requested_posts_by_name
		posts = $database.all_by("name", @student)
	end

	# TODO Can this be consolidated into one method, since Database has something similar?
	# Get all of the students' posts from the requested date.
	#
	# Returns an array of requested posts.
	def get_posts_by_date
		posts = get_requested_posts_by_name
		requested_posts = []
		posts.each do |date|
			post_day = date.split(",")
			post_day = post_day[0].to_i
			post_day = Time.at(post_day).strftime("%D")
			if post_day == @day
				requested_posts << date
			end
		end
		return requested_posts
	end

	# Get all of today's posts.
	# 
	# Returns an Array of posts.
	def Posts.today

	    today_filter = Proc.new {|row| Time.at(row["time"].to_i).yday == Time.now.yday}

	    rows = $database.all_filtered(today_filter)
	    rows.map {|row| row.split(",")}

	end
end