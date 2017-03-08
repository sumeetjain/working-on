RSpec.describe(Student, '#last_submission') do
	it("displays the last item in Database") do
	    # Setup
	    row = "'07/08/88','1488668340','02:24:33','Ben','1','What is this dude talking about?'"
	    $database.add(row)
	    student = Student.new("Ben")
	    
	    # Exercise
	    student = student.last_submission
	    
	    # Verify
	    expect(student).to eq("07/08/88,1488668340,02:24:33,Ben,1,What is this dude talking about?")

	end 	
end

 RSpec.describe(Student, '#last_submission_at') do
	it("checks to see if a user exists and has posted today, and finding that they do exist but have not posted, says so") do
	    # Setup
	    student = Student.new("Ben")
	    row = "'07/08/88','1488668340','02:24:33','Ben','1','What is this dude talking about?'"
	    $database.add(row)
	    
	    # Exercise
	    student = student.last_submission_at
	    
	    # Verify
	    expect(student).to eq("first_of_day")

	end
end