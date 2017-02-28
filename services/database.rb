# Contains all functionality for interacting with the database.

class Database

  def initialize(file='./public/submissions.csv')
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

  # Get all rows.
  # 
  # keys - Array of column headers.
  # 
  # Returns an Array of rows as Strings.
  def everything(keys)
    all_info = []

    CSV.foreach(@file, {headers:true}) do |row|
      keys.each do |key|
        row[key] = row[key].chomp
      end
      
      all_info << row.to_s
    end

    return all_info
  end
end