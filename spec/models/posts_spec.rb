RSpec.describe(Posts, "gets requested posts by filter") do
	it "gets requested posts by name" do
		names = Posts.new({"student"=>"Jamie", "day"=>"03/06/14"})
		names = names.get_requested_posts_by_name

		expect(names[0]).to eq("1488731453,first_of_day,Jamie,2,Hey")
	end

	# it "to MM/DD/YY format" do
	# 	time = TimeFormatter.new("1488456000").parseDate

	# 	expect(time).to eq("03/02/17")
	# end
end