require 'spec_helper.rb'
require './services/database.rb'
require './services/time_formatter.rb'
require './models/student.rb'
require './models/submission.rb'
require './models/posts.rb'
require 'csv'
require 'pry'

RSpec.describe("database", '#get_items_by_header') do
  it("creates an Array by loading all the unique items of a specific header catagory") do
    # Setup
    database = Database.new

    # Exercise
    database = database.get_items_by_header("name")

    # Verify
    expect(database.class == Array)
  end
 end

 RSpec.describe("database", '#posts_today') do
    it("Loads data, specifically posts from today,from the storage CSV into an Array for use") do
    # Setup
    database = Database.new

    # Exercise
    database = database.posts_today

    # Verify
    expect(database.class == Array)
  end
end