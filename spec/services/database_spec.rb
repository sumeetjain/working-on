RSpec.describe(Database, '#all_by') do
    it("Gets all values from the specified key in the specified tables") do
        # Setup
        params = {:name=>"Ben", :submission=>"bdfafafafaf", :stressLevel=>"1"}
        Submission.new.create(params)

        # Exercise
        test = $database.all_by("submissions", "name", "Ben")

        # Verify
        expect(test.values).to eq([["#{Time.now.strftime("%x")}", "#{Time.now.to_i}", "first_of_day", "Ben", "1", "bdfafafafaf"]])


        # Teardown
        $database.erase_row_by_column_value("submissions", "name", "Ben")
   end     
 end

 RSpec.describe(Database, '#get_items_by_header') do
   it("Gets all values from the specified key in the specified tables") do
       # Setup
       params = {:name=>"Ben", :submission=>"bdfafafafaf", :stressLevel=>"1"}
       Submission.new.create(params)

       #exercise
       test = $database.get_items_by_header("name", "submissions")

       # Verify
       expect(test).to eq(["Ben"])

        # Teardown
        $database.erase_row_by_column_value("submissions", "name", "Ben")
    end     
end
