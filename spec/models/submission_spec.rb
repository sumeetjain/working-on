RSpec.describe(Submission, '.names') do
  it("displays all the names in the database") do
    # Setup
    
    params = {:name=>"Ben", :submission=>"bdfafafafaf", :stressLevel=>"1"}
    Submission.new.create(params)
    
    # Exercise
    submission = Submission.names
	

    # Verify
    expect(submission.last).to eq("Ben")
	
    # Teardown
    $database.erase_row_by_column_value("submissions", "name", "Ben")
    end
 end

RSpec.describe(Submission, '.dates') do
  it("displays all the dates in the database") do
    # Setup
    params = {:name=>"Ben", :submission=>"bdfafafafaf", :stressLevel=>"1"}
    Submission.new.create(params)
    
    # Exercise
    submission = Submission.dates
    # Verify
    expect(submission.last).to eq("#{Time.now.strftime("%x")}")
    
    # Teardown
    $database.erase_row_by_column_value("submissions", "name", "Ben")
    end
 end