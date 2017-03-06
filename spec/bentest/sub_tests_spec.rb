require 'spec_helper.rb'
require 'csv'
require './models/student.rb'
require 'pry'
require 'databasetest.rb'
require './models/submission.rb'


RSpec.describe(Submission, '#Submission.names') do
  it("displays all the names in the database") do
    # Setup
    database = Database.new
    row = "1488668340,02:24:33,Ben,1,What is this dude talking about?\n"
    database.add(row)

    # Exercise
    submission = Submission.names
	CSV.open("./public/testibase.csv", "w",:write_headers=> true,
    :headers => ["time","interval","name","stressLevel","submission"
	]) do |csv|
		csv << []
	end

    # Verify
    submission.should eql ["Ben"]
    binding.pry
     #teardown?

	end
 end

RSpec.describe(Submission, '#Submission.dates') do
  it("displays all the dates in the database") do
    # Setup
    database = Database.new
    row = "1488668340,02:24:33,Ben,1,What is this dude talking about?\n"
    database.add(row)
    
    # Exercise
    submission = Submission.dates
    CSV.open("./public/testibase.csv", "w",:write_headers=> true,
    :headers => ["time","interval","name","stressLevel","submission"
	]) do |csv|
		csv << []
	end

    # Verify
    submission.should eql  ["03/04/17"]
	end
 end