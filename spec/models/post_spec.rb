RSpec.describe(Post, '#format_post_front_page') do
	it("takes an array of csv row strings and formats them for front page display") do
	    # Setup
	    row = [["1488668340","02:24:33","Ben","1","What is this dude talking about?\n"]]	
	    # Exercise
	    student = Post.new(row).format_post_front_page

	    # Verify
	    expect(student).to eq([["Ben","03/04 @ 04:59PM", "What is this dude talking about?\n"]])

	end 	
end

RSpec.describe(Post, '#format_post_admin_page') do
	it("takes an array of csv row strings and formats them for admin page display") do
	    # Setup
	    row = [["1488668340","02:24:33","Ben","1","What is this dude talking about?\n"]]	
	    # Exercise
	    student = Post.new(row).format_post_admin_page

	    # Verify
	    expect(student).to eq([["Ben","03/04/17 04:59PM", "02:24:33", "1", "What is this dude talking about?\n"]])

	end 	
end