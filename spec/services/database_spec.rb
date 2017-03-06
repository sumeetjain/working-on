RSpec.describe(Database, '#all_by') do
	it("displays the last item in Database") do
	  
	    # Setup & Exercise
	    test = $database.all_by("name", "Ben")
	    # Verify
	    expect(test.last).to eq("1488668340,02:24:33,Ben,1,What is this dude talking about?\n")


	end 	
end
