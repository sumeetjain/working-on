class Post

  # TODO Capture single-post related methods here.
  # (Like what's currently in getinfo.erb.)
  # Get all of today's posts.
	# 
	# Returns an Array of posts.

	def Post.today

	    today_filter = Proc.new {|row| Time.at(row["time"].to_i).yday == Time.now.yday}

	    rows = $database.all_filtered(today_filter)
	    rows.map {|row| row.split(",")}
	end

end