RSpec.describe(Submission, '#Submission.names') do
  it("displays all the names in the database") do
    # Setup
    row = "'07/08/88','1488668340','02:24:33','Ben','1','What is this dude talking about?'"
    $database.add(row)

    # Exercise
    submission = Submission.names
	

    # Verify
    expect(submission.last).to eq("Ben")
	end
 end

RSpec.describe(Submission, '#Submission.dates') do
  it("displays all the dates in the database") do
    # Setup
    row = "'07/08/88','1488668340','02:24:33','Ben','1','What is this dude talking about?'"
    $database.add(row)
    
    # Exercise
    submission = Submission.dates
    # Verify
    expect(submission.last).to eq("03/04/17")

    end
 end