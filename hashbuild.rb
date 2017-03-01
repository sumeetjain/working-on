require 'pry'
require 'csv'

submissions = {}

CSV.foreach('./public/database.csv', {headers:true}) do |row|
	day = row["time"].to_i
	date = Time.at(day).utc.yday
	if !submissions[date]
		submissions[date] = {}
	end

	student = row["name"]
	if !submissions[date][student]
		submissions[date][student] = []
	end

	post = {}
	post[:time] = row["time"]
	post[:interval] = row["interval"]
	post[:stressLevel] = row["stressLevel"]
	post[:submission] = row["submission"]
	submissions[date][student] << post
end

binding.pry