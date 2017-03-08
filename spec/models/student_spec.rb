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

RSpec.describe(Student, '#name_is_new') do
	it "returns false if a name isn't new" do
		# Setup
		student = Student.new("Mike")

		# TODO Add a "Mike" student to the 'students' table.

		# Exercise/Verify
		expect(student.name_is_new).to be_false
	end

	it "returns true if a name is new" do
		# AT THIS MOMENT, THE TABLE (IN FACT, THE ENTIRE DATABASE) MIGHT AS
		# WELL BE TOTALLY EMPTY.

		# Setup
		student = Student.new("Mike")

		# Exercise/Verify
		expect(student.name_is_new).to be_true

		# Teardown
		# 
		# AT THIS MOMENT, THE TABLE (IN FACT, THE ENTIRE DATABASE) MIGHT AS
		# WELL BE TOTALLY EMPTY.
	end
end



