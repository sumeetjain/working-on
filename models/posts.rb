# TODO - Refactor this entire class to not be limited to only getting 
#        collections of posts for a specific user and date. Let is be a more
#        generic PostCollection creator.

# This class is for functionality related to ALL of a student's posts for a
# particular day. That is, one object/instance of this class is ALL of a 
# student's posts for one day.

class Posts

	# Initialize based on the requested search parameters (student posts by date)
	def initialize(params)
		@student = params[:student]
		@day = params[:day]
    @today = Time.now.strftime("%D")
	end

  def today
    return @today
  end

	# Get all posts of the requested student.
	def get_requested_posts_by_name
		posts = $database.all_by("name", @student)
	end

	# TODO Can this be consolidated into one method, since Database has something similar?
	# Get all of the students' posts from the requested date.
	#
	# Returns an array of requested posts.
	def get_posts_by_date(day=@day)
		posts = get_requested_posts_by_name
		requested_posts = []
		posts.each do |date|
			post_day = date.split(",")
			post_day = post_day[0].to_i
			post_day = Time.at(post_day).strftime("%D")
			if post_day == day
				requested_posts << date
			end
		end
		return requested_posts
	end

	# Gets all posts for today in an arrays of arrays ["name","date","submission"]
  #
  # compares today's day to row day
  # if day is today in row, return rows ["name","date","submission"]
  def posts_today()
  postCollection = []
  todaysYearDay = Time.now.yday
  CSV.foreach(@file, {headers:true}) do |row|
    rowEpoch = Time.at(row["time"].to_i)
    if rowEpoch.yday == todaysYearDay
       postCollection.push([row["name"],rowEpoch.strftime("%m/%d @ %I:%M%p"), row["submission"]])
      end
    end

    return postCollection
  end

end