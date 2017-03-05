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

  # Get all rows through a particular filter if that filter returns true
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

  #Given a particular key and value, filters csv rows where that columns entry = value
  #
  # key   - String of the column header to filter on.
  # value - String of the value the column header must match.
  #
  #returns an array of CSV rows as strings
  def all_by(key, value)
    filter = Proc.new { |row| row[key] == value }
    all_filtered(filter)
  end

  #Given a time, filters csv based on the day value in time column
  #
  # a_day - a time object in Epoch format
  #
  # returns an array of CSV rows as strings
  def day_is(a_day)
    filter = Proc.new {|row| Time.at(row["time"].to_i).yday == a_day.yday}
    all_filtered(filter)
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
end
