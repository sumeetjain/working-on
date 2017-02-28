require 'csv'

def displayInformation()
	submissions = []
	CSV.foreach('./public/submissions.csv', {headers:true}) do |row|
		row["time"] = row["time"].chomp
		row["name"] = row["name"].chomp
		row["submission"] = row["submission"].chomp
		submissions << row.to_s
	end
	return submissions
end