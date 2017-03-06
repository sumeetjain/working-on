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

  ###
  def all_by(key, value)
    filter = Proc.new { |row| row[key] == value }
    all_filtered(filter)
  end

  ###
  def all
    all_posts = []
    CSV.foreach(@file, {headers:true}) { |row| all_posts << row.to_s }
    return all_posts
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