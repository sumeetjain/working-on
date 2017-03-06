RSpec.describe("Time Formatter converts", "seconds") do
	it "to HH:MM:SS format" do
		time = TimeFormatter.new("800").time_as_hms

		expect(time).to eq("00:13:20")
	end

	it "to MM/DD/YY format" do
		time = TimeFormatter.new("1488456000").parseDate

		expect(time).to eq("03/02/17")
	end
end