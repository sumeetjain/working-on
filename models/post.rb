# Contains all functionality relating to formatting individual posts.

class Post

	# Initializes the Post class with a requested Array of posts.
  #
  # With current functionality, this will be either all of today's posts or posts by student on a certain day.
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