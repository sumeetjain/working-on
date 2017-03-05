RSpec.describe(Database, '#get_items_by_header') do
  it("creates an Array by loading all the unique items of a specific header catagory") do
    # Setup


    # Exercise
    $database = $database.get_items_by_header("name")

    # Verify
    expect($database.class == Array)
  end
 end

 RSpec.describe(Database, '#a_days_post_info') do
    it("Gets CSV rows if they happened today, gets them ready for HTML") do
    # Setup

    # Exercise
    $database = $database.a_days_post_info

    # Verify
    expect($database.class == Array)
  end
end