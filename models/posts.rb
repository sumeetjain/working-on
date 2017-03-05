# TODO - Refactor this entire class to not be limited to only getting 
#        collections of posts for a specific user and date. Let is be a more
#        generic PostCollection creator.

# This class is for functionality related to ALL of a student's posts for a
# particular day. That is, one object/instance of this class is ALL of a 
# student's posts for one day.

class Posts

	# Initialize based on the requested search parameters (student posts by date)
	def initialize(post_collection=[])
		@posts = post_collection
	end

	# Get all posts of the requested student.
	def sort_by_name(student_name)
		@posts = $database.all_by("name", student_name)
	end


	# def sort_by_date(day)
	# 	@posts = $database.all_by("date",day)
	# end

	# TODO Can this be consolidated into one method, since Database has something similar?
	# Get all of the students' posts from the requested date.
	#
	# Returns an array of requested posts.
	def sort_by_date(given_day,student_name)
		posts = sort_by_name(student_name)
		requested_posts = []
		posts.each do |date|
			post_day = date.split(",")
			post_day = post_day[0].to_i
			post_day = Time.at(post_day).strftime("%D")
			if post_day == given_day
				requested_posts << date
			end
		end
		return requested_posts
	end

	def posts_today_new()
		today = Time.now.yday
		today_posts = $database.all_by("time",today)
	end

	###Searches through all rows, given time
	#
	# given todays year day, compares whether day in row is same as today
	### returns an array of name, format time, submission
	# TODO Refactor this to use all_filtered.
	def Posts.posts_today()
		postCollection = []
		todaysYearDay = Time.now.yday
		CSV.foreach('./public/database.csv', {headers:true}) do |row|
			rowEpoch = Time.at(row["time"].to_i)
			if rowEpoch.yday == todaysYearDay
				postCollection.push([row["name"],rowEpoch.strftime("%m/%d @ %I:%M%p"), row["submission"]])
			end
		end

    return postCollection
	end
end