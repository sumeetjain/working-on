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
  # Returns a Hash of data.
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

  def get_items_by_header(header)
    list = []

    CSV.foreach(@file, {headers:true}) do |row|
      item = row[header]
      list << item
    end
    list = list.uniq
    return list
  end
  
  def parseDates(array_of_epoch_time)
    new_time = []
    array_of_epoch_time.each do |time|
      time = time.to_i
      new_time << Time.at(time).strftime("%D")
    end
    new_time = new_time.uniq
    return new_time
  end
end