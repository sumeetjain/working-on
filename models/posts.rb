# TODO - Refactor this entire class to not be limited to only getting 
#        collections of posts for a specific user and date. Let is be a more
#        generic PostCollection creator.

# This class is for functionality related to ALL of a student's posts for a
# particular day. That is, one object/instance of this class is ALL of a 
# student's posts for one day.

class Posts

	# Initialize based on the requested search parameters (student posts by date)
	def initialize(post_collection=$database.all)
		@posts = post_collection
	end

	# Get all posts of the requested student.
	def sort_by_name(student_name)
		@posts = Database.new('./public/database.csv', @posts ).all_by("name", student_name)
	end

	#
	def sort_by_date(day)
		@posts = Database.new('./public/database.csv', @posts ).by_day(day)
	end

	# # TODO Can this be consolidated into one method, since Database has something similar?
	# # Get all of the students' posts from the requested date.
	# #
	# # Returns an array of requested posts.
	# def sort_by_date(given_day,student_name)
	# 	posts = sort_by_name(student_name)
	# 	requested_posts = []
	# 	posts.each do |date|
	# 		post_day = date.split(",")
	# 		post_day = post_day[0].to_i
	# 		post_day = Time.at(post_day).strftime("%D")
	# 		if post_day == given_day
	# 			requested_posts << date
	# 		end
	# 	end
	# 	return requested_posts
	# end

	# Gets CSV rows if they happened today, collects names, dates, and submissions
	#
	# day - Time in EPOCH format.  default is Time.now
	# 
	# returns an array of arrays where an array element is
	# name, format time, submission
	def Posts.a_days_post_info(day=Time.now)
		post_info = []
		@posts = Database.new('./public/database.csv', @posts ).by_day(day)
    return @posts
	end
end