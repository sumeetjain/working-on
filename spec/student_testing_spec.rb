require 'spec_helper.rb'
require 'databasetest.rb'
require 'csv'
require './models/student.rb'
require 'pry'
require './services/time_formatter.rb'

RSpec.describe(Student, '#last_submission') do
  it("displays the last item in Database") do
    # Setup
    student = Student.new("Ben")
    
    # Exercise
    student = student.last_submission

    # Verify
    student.should eql "1488668340,02:24:33,Ben,1,What is this dude talking about?\n"
	end
 end

 RSpec.describe(Student, '#last_submission_at') do
  it("checks to see if a user has posted today, and finding that they have not, says so") do
    # Setup
    student = Student.new("Ben")
    
    # Exercise
    student = student.last_submission_at

    # Verify
    student.should eql "first_of_day"
	end
 end