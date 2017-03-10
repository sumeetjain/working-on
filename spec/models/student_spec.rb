	RSpec.describe(Student, '#last_submission_at') do
	it("checks to see if a user exists and has posted today, and finding that they do exist but have not posted, says so") do
	    # Setup
  		params = {:name=>"Ben", :submission=>"bdfafafafaf", :stressLevel=>"1"}
      Submission.new.create(params)
	    student = Student.new("Ben")
	    
	    # Exercise
	    student = student.last_submission_at
	    
	    # Verify
	    expect(student).to eq("first_of_day")

	    # Teardown
	    $database.erase_row_by_column_value('submissions', "name", "Ben")

	end
end

RSpec.describe(Student, '#valid?') do
	it "returns false if a name isn't new" do
		# TODO Run all tests in isolation, meaning that each test case starts from
		#      an empty "universe"--build everything the test case needs from 
		#      scratch.

		# Setup
		student = Student.new("Worf")
		# Exercise/Verify
		expect(student.valid?).to be true
	end

	it "returns false if name has been added" do
		# Setup
		student = Student.new("Kenny")
		student.save

		# Exercise/Verify
		expect(student.valid?).to be false
		
    # Teardown
    $database.erase_row_by_column_value('submissions', "name", "Ben")
	end

	# TODO No need for this test. Make a new 'describe' section
	#      for Student#remove.
	# it "returns true if added student name has been removed" do
	# 	# Setup
	# 	student = Student.new("Dingo Dog")
	# 	student.save
	# 	# Exercise
	# 	student.remove
	# 	# Verify
	# 	expect(student.valid?).to be true
	# end
end



