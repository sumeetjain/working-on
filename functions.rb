require 'csv'

def storeInformation(params)
	time = Time.now
	time = time.strftime("%a: %b %d: %I:%M:%P")
	new_submission = time + "," + params[:name] + "," + params[:submission] + params[:s"\n"
	File.open('./public/submissions.csv', 'a+') do |file|
		file << new_submission
	end
end

def displayInformation()
	submissions = []
	CSV.foreach('./public/submissions.csv', {headers:true}) do |row|
		row["time"] = row["time"].chomp
		row["name"] = row["name"].chomp
		row["submission"] = row["submission"].chomp
		row["stress-level"] =row["stress-level"].chomp
		submissions << row.to_s
	end
	return submissions
end