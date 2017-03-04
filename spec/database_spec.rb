require 'spec_helper.rb'
require './services/database.rb'
require './services/time_formatter.rb'
require './models/student.rb'
require './models/submission.rb'
require './models/posts.rb'
require 'csv'
require 'pry'

RSpec.describe(Database, '#get_items_by_header') do
  it("creates an Array by loading all the unique items of a specific header catagory") do
    # Setup
    test_database = $database

    # Exercise
    test_database.get_items_by_header("name")

    # Verify
    expect(test_database.class == Array)
  end
 end

 RSpec.describe(Database, '#posts_today') do
    it("Loads data, specifically posts from today,from the storage CSV into an Array for use") do
    # Setup
    test_database = $database
    # Exercise
    test_database.posts_today

    # Verify
    expect(test_database.class == Array)
  end
end