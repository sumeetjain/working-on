# Contains all functionality for interacting with the database.

class Database

  def initialize(file='./public/database.csv')
    @file = file
  end

  # Adds a row to the database.
  # 
  # row - String to append.
  def add(row)
    File.open(@file, 'a+') do |file|
      file << row
    end
  end

  # Gets the csv file.
  # 
  # Builds hash of data for use on the site.
  # 
  # Returns a Hash of data. Not used
  def everything()
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
    return submissions
  end

  # Get all rows through a particular filter.
  # 
  # key   - String of the column header to filter on.
  # value - String of the value the column header must match.
  # 
  # Returns an Array of row Strings.
  def all_filtered(key, value)
    list = []
    CSV.foreach(@file, {headers:true}) do |row|
      if row[key] == value
        list << row.to_s
      end
    end

    return list
  end
  ###Searches through all rows, given time
  #
  # given todays year day, compares whether day in row is same as today
  ### returns an array of name, format time, submission
  def posts_today()
  postCollection = []
  todaysYearDay = Time.now.yday
  CSV.foreach(@file, {headers:true}) do |row|
    rowEpoch = Time.at(row["time"].to_i)
    if rowEpoch.yday == todaysYearDay
       postCollection.push([row["name"],rowEpoch.strftime("%m/%d @ %I:%M%p"), row["submission"]])
      end
    end

    return postCollection
  end

end