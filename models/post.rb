# TODO Set @date (and the rest) in the constructor, and then use attr_reader
#      to create getter methods for each attribute.

# Contains all functionality relating to formatting individual posts.

class Post

	# Initializes the Post class with a pg object held inside
  #
  # returns @post ready for calling out specific portions of the pg object.
	def initialize(post)	
		@post = post
	end

	def id
		@post["id"]
	end

	def date
		@post["date"]
	end

	def time
		@post["time"]
	end

	def interval
		@post["interval"]
	end

	def name
		Student.get_name(id)
	end

	def stressLevel
		@post["stresslevel"]
	end

	def submission
		@post["submission"]
	end

	# def git_name
	# 	@post["git_name"]
	# end

	# Returns a String containing just info needed for the AJAX functionality.
	def to_string
		"#{name}, #{formatted_time}, #{submission}"
	end

	def formatted_time
		Time.at(time.to_i).strftime("%m/%d @ %I:%M%p")
	end
end