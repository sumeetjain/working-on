class Post

#splits up each csv row by ,
#
#returns an array
  	def splitRow(post)
  		current_row = post.split(",")
  		return current_row
  	end
#targets the section that holds the time in epoc form
#
#returns it in a m/d/y Hr:Min:sec am/pm format
 	def getDate(current_row)
		date = current_row[0].to_i
		date = Time.at(date).strftime('%x %I:%M:%S%p')
	return date
	end
end