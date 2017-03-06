RSpec.describe(Student, '#last_submission') do
	it("displays the last item in Database") do
	    # Setup
	    row = "1488668340,02:24:33,Ben,1,What is this dude talking about?\n"
	    $database.add(row)
	    student = Student.new("Ben")
	    # Exercise
	    student = student.last_submission
	    # Verify
	    expect(student).to eq("1488668340,02:24:33,Ben,1,What is this dude talking about?\n")


	end 	
end

 RSpec.describe(Student, '#last_submission_at') do
	it("checks to see if a user exists and has posted today, and finding that they do exist but have not posted, says so") do
	    # Setup
	    student = Student.new("Ben")
	    row = "1488668340,02:24:33,Ben,1,What is this dude talking about?\n"
	    $database.add(row)
	    
	    # Exercise
	    student = student.last_submission_at
	    
	    # Verify
	    expect(student).to eq("first_of_day")


	end
end