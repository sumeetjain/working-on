require 'spec_helper.rb'
require 'databasetest.rb'
require './models/student.rb'
require './services/time_formatter.rb'
require 'csv'
require 'pry'

RSpec.describe(Student, '#last_submission') do
	it("displays the last item in Database") do
	    # Setup
	    database = Database.new
	    row = "1488668340,02:24:33,Ben,1,What is this dude talking about?\n"
	    database.add(row)
	    student = Student.new("Ben")
	    
	    # Exercise
	    student = student.last_submission
	    CSV.open("./public/testibase.csv", "w",:write_headers=> true,
    	:headers => ["time","interval","name","stressLevel","submission"
		]) do |csv|
			csv << []
		end
	    # Verify
	    student.should eql "1488668340,02:24:33,Ben,1,What is this dude talking about?\n"
	end 	
end

 RSpec.describe(Student, '#last_submission_at') do
	it("checks to see if a user exists and has posted today, and finding that they do exist but have not posted, says so") do
	    # Setup
	    student = Student.new("Ben")
	    database = Database.new
	    row = "1488668340,02:24:33,Ben,1,What is this dude talking about?\n"
	    database.add(row)
	    
	    # Exercise
	    student = student.last_submission_at
	    CSV.open("./public/testibase.csv", "w",:write_headers=> true,
    	:headers => ["time","interval","name","stressLevel","submission"
		]) do |csv|
			csv << []
		end
	    # Verify
	    student.should eql "first_of_day"
	end

	it("checks to see if a user exists and has posted today, and finding that they do exist and have posted, posts the time they posted at in hms") do
	    # Setup
	    student = Student.new("Ben")
	    database = Database.new
	    time= Time.now.to_i
	    row = "#{time},02:24:33,Ben,1,What is this dude talking about?\n"
	    database.add(row)
	    
	    # Exercise
	    student = student.last_submission_at
	    time2 = TimeFormatter.new(time)
	    time2 =time2.time_as_hms
	    CSV.open("./public/testibase.csv", "w",:write_headers=> true,
    	:headers => ["time","interval","name","stressLevel","submission"
		]) do |csv|
			csv << []
		end
	    # Verify
	    student.should eql time2

	end
	it("checks to see if a user exists and has posted today, and finding that they do not exist says so") do
	    # Setup
	    student = Student.new("Bob")
	    database = Database.new
	    time= Time.now.to_i
	    row = "#{time},02:24:33,Ben,1,What is this dude talking about?\n"
	    database.add(row)
	    
	    # Exercise
	    student = student.last_submission_at
	    time2 = TimeFormatter.new(time)
	    time2 =time2.time_as_hms
	    CSV.open("./public/testibase.csv", "w",:write_headers=> true,
    	:headers => ["time","interval","name","stressLevel","submission"
		]) do |csv|
			csv << []
		end
	    # Verify
	    student.should eql "first_of_day"

	end
 end