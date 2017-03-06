# Contains all functionality for interacting a file in the database.
# operations on the CSV and on CSV rows

# @rows - an array of CSV rows
# @file - the file location

class Database

  HEADERS = ["time","interval","name","stressLevel","submission"]

  def initialize(file='./public/database.csv',rows = [])
    @file = file
    if rows != []
      @rows = rows
    else
      @rows = self.all
    end
  end

  ## there is another syntax for these simple returns, but I don't recall it
  def file
    return @file
  end

  def rows
    return @rows
  end

  def all(returnType = method(:returnRow))
    filter = Proc.new { true }
    return all_filtered(filter,returnType)
  end

  # Adds a row to the database.
  # 
  # row - String to append.
  def add(row)
    File.open(@file, 'a+') do |file|
      file << row
    end
  end

  # given a CSV row, build a hash for that row based on headers
  #
  # returns hash
  def returnHash(array_of_headers,this_row)
    hashBuilder = {}
    array_of_headers.each { |this_header| hashBuilder.merge!(this_header => this_row[this_header]) }
    return hashBuilder
  end

  # given a CSV row, build an array for that row based on headers
  #
  # returns array of arrays
  def returnArray(array_of_headers,this_row)
    arrayBuilder = []
    array_of_headers.each { |this_header| arrayBuilder.push(this_row[this_header]) }
    return arrayBuilder
  end

  def returnRow(array_of_headers, this_row)
    return this_row
  end

  # Get all rows through a particular filter if that filter returns true
  #
  # default return style is to return CSV Rows.  Can pass alternate paramaters: returnArray, returnHash
  # 
  # Returns Array of Arrays
  def all_filtered(filter, returnType = method(:returnRow))
    list = []
    CSV.foreach(@file, {headers:true}) do |row|
      if filter.call(row) == true
        list << returnType.call(HEADERS,row)
      end
    end
    return list
  end

  #Given a particular key and value, filters csv rows where that columns entry = value
  #
  # key   - String of the column header to filter on.
  # value - String of the value the column header must match.
  #
  #returns an Array of Arrays
  def all_by(key, value)
    filter = Proc.new { |row| row[key] == value }
    @rows = all_filtered(filter)
  end

  # TODO This belongs in the posts class
  # Given a time, filters csv based on the day value in time column
  #
  # a_day - a time object in Epoch format
  #
  # returns an Array of Arrays
  def by_day(a_day)
    filter = Proc.new {|row| Time.at(row["time"].to_i).yday == a_day.yday}
    @rows = all_filtered(filter, method(:returnArray))
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
