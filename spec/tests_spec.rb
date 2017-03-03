require 'spec_helper.rb'
require './services/database.rb'
require './services/time_formatter.rb'
require './models/student.rb'
require './models/submission.rb'
require './models/posts.rb'
require 'csv'
require 'pry'

RSpec.describe("database", '#posts_today') do
  it("checks class") do
    # Setup
    database = Database.new

    # Exercise
    database = database.get_items_by_header("name")

    # Verify
    expect(database.class == Array)
  end
    it("checks class") do
    # Setup
    database = Database.new

    # Exercise
    database = database.posts_today

    # Verify
    expect(database.class == Array)
  end
end
