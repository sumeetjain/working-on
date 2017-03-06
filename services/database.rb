# Contains all functionality for interacting a file in the database.
# operations on the CSV and on CSV rows

# @rows - an array of CSV rows - default is all the rows from the file in an array
# @file - the file location - default is database.csv
# @headers - the headers of the CSV file given

class Database

  def initialize(file='./public/database.csv',rows = [])
    @file = file
    if rows != []
      @rows = rows
    else
      @rows = self.all
    end
    @headers = CSV.table(@file).headers().map {|i| i.to_s}
  end

  attr_accessor :file, :rows, :headers

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

  # For a column header in @rows, modifies those values on filter
  #
  # returns @rows as an array of CSV rows
  def mod_column_entries(header, filter)
    @rows.map {|column_val| filter.call(column_val)}
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
        list << returnType.call(@headers,row)
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

  # TODO : The following methods need to be adjusted so that they cannot be called
  # outside the class, but I am not sure how
  #
  # given a CSV row, build a hash for that row based on headers
  #
  # returns hash
  def returnHash(arr_headers,csv_row)
    hashBuilder = {}
    arr_headers.each { |this_header| hashBuilder.merge!(this_header => csv_row[this_header]) }
    return hashBuilder
  end

  # given a CSV csv_row, build an array for that csv_row based on headers
  #
  # returns array of arrays
  def returnArray(arr_headers,csv_row)
    arrayBuilder = []
    arr_headers.each { |this_header| arrayBuilder.push(csv_row[this_header]) }
    return arrayBuilder
  end

  def returnRow(arr_headers, csv_row)
    return csv_row
  end

end
