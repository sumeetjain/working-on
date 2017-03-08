# RSpec.describe(Posts, '#split_post_strings') do
# 	it("takes an array of strings and splits it into an array of arrays") do
# 	    # Setup
# 	    post = ["This,is,a,string", "This,is,another,string"]	
# 	    # Exercise
# 	    student = Posts.new({:student=>"student", :day=>"day"}).split_post_strings(post)
# 	    # Verify
# 	    expect(student).to eq([["This", "is", "a", "string"], ["This", "is", "another", "string"]]
# 		)

# 	end 	
# end

# RSpec.describe(Posts, '#get_requested_posts_by_date') do
# 	it("takes an array of posts by name and returns an array of posts by date") do
# 	    # Setup
# 	    row = ["1488668340,02:24:33,Ben,1,What is this dude talking about?\n"]
# 	    # Exercise
# 	    student = Posts.new({:student=>"Ben", :day=>"03/04/17"}).get_requested_posts_by_date(row)
# 	    # Verify
# 	    expect(student).to eq([["1488668340", "02:24:33", "Ben", "1", "What is this dude talking about?\n"]])

# 	end 	
# end
