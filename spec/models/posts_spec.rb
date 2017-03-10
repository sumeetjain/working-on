
RSpec.describe(Posts, '#hold_posts') do
	it("") do
	    
	    # Setup
	    params = {:name=>"Ben", :submission=>"bdfafafafaf", :stressLevel=>"1"}
	    
	    Submission.new.create(params)
	    
	    # Exercise
	    student = Posts.new({:student=>"Ben", :day=>"#{Time.now.strftime("%x")}"}).hold_posts
	    
	    # Verify
	    expect(student.class).to eq(Array)

	    # Teardown
	    $database.erase_row_by_column_value("submissions", "name", "Ben")
	end 	
end
