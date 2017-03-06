class Post
  # TODO Capture single-post related methods here.
  # (Like what's currently in getinfo.erb.)
  	def splitRow(post)
  		current_row = post.split(",")
  		return current_row
  	end

 	def getDate(current_row)
		date = current_row[0].to_i
		date = Time.at(date).strftime('%x %I:%M:%S%p')
	return date
	end
end