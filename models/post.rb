# Contains all functionality relating to formatting individual posts.

class Post

	# Initializes the Post class with a pg object held inside
  #
  # returns @post ready for calling out specific portions of the pg object.
	def initialize(post)	
	@post = post
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
		@post["name"]
	end

	def stressLevel
		@post["stresslevel"]
	end

	def submission
		@post["submission"]
	end
end