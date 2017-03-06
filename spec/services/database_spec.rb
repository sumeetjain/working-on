RSpec.describe(Database, '#all_by') do
    it("displays the last item in Database") do
        #all_by calls all_filtered, so this is inharently testing all_filtered.
        # Setup & Exercise
        test = $database.all_by("name", "Ben")
        # Verify
        expect(test.last).to eq("1488668340,02:24:33,Ben,1,What is this dude talking about?\n")
    end     
 end
RSpec.describe(Database, '#get_items_by_header') do
   it("displays a list of unique headers") do
     
       # Setup & Exercise
       test = $database.get_items_by_header("name")
       # Verify
       expect(test).to eq(["Ben"])
    end     
end