# Contains all functionality for interacting with the database.

class Database

  # Adds a row to the database.
  # 
  # row - String to append.
  def add(row)
    File.open('./public/submissions.csv', 'a+') do |file|
      file << row
    end
  end
end