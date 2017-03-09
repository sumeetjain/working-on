
RSpec.describe(Posts, '#hold_posts') do
	it("") do
	    
	    # Setup
	    Database.new.erase_row_by_column_value("Ben", "name", "submissions")
	    row = ["1488668340,02:24:33,Ben,1,What is this dude talking about?"]
	    
	    # Exercise
	    student = Posts.new({:student=>"Ben", :day=>"03/04/17"}).hold_posts
	    
	    # Verify
	    expect(student).to eq([["1488668340", "02:24:33", "Ben", "1", "What is this dude talking about?"]])

	    # Teardown
	    Database.new.erase_row_by_column_value("Ben", "name", "submissions")
	end 	
end
