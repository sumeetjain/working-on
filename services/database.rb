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

  def get_all_data
    list = []
    CSV.foreach(@file, {headers:true}) do |row|
      list << row
    end
    return list
  end

  # Get all rows through a particular filter.
  # 
  # Returns an Array of row Strings.
  def all_filtered(filter)
    list = []
    CSV.foreach(@file, {headers:true}) do |row|
      if filter.call(row) == true
        list << row.to_s
      end
    end

    return list
  end

  def all_by(key, value)
    filter = Proc.new { |row| row[key] == value }
    all_filtered(filter)
  end

  # Searches through all rows, given time
  #
  # given todays year day, compares whether day in row is same as today
  # returns an array of name, format time, submission
  def posts_today()
    postCollection = []
    todaysYearDay = Time.now.yday
    CSV.foreach(@file, {headers:true}) do |row|
      rowEpoch = Time.at(row["time"].to_i)
      if rowEpoch.yday == todaysYearDay
        postCollection.push([row["name"],rowEpoch.strftime("%m/%d @ %I:%M%p"),row["submission"]])
      end
    end

    return postCollection
  end

  # Get all rows based on a requested header value
  #
  # Removes duplicate entries.
  #
  # Returns an Array of Strings.
  def get_items_by_header(header)
    list = []

    CSV.foreach(@file, {headers:true}) { |row| list << row[header] }

    return list.uniq
  end

  ###
  def stress_level_today()
    postCollection = []
    todaysYearDay = Time.now.yday
    CSV.foreach(@file, {headers:true}) do |row|
      rowEpoch = Time.at(row["time"].to_i)
      if rowEpoch.yday == todaysYearDay
        postCollection.push([row["name"],rowEpoch.strftime("%I"),row['stressLevel']])
      end
    end

    return postCollection
  end
end
