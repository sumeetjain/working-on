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

  # Get all rows.
  # 
  # keys - Array of column headers.
  # 
  # Returns an Array of rows as Strings.
  def everything(keys)
    all_info = []

    CSV.foreach(@file, {headers:true}) do |row|
      keys.each do |key|
        row[key]
      end
      
      all_info << row.to_s
    end

    return all_info
  end

  def getPreviousEntry(student)
    students = []
    CSV.foreach(@file, {headers:true}) do |row|
      if row["name"] == student
        students << row.to_s
      end
    end
    if students == []
      last_checkin = nil
    else
      last_checkin = students.last
      last_checkin = last_checkin.split(",")
      last_checkin = last_checkin[0].to_i
      if Time.at(last_checkin).utc.day != Time.now.day
        last_checkin = nil
      end
    end
    return last_checkin
  end

  def getPreviousEntryTime(array)
    if students == []
      last_checkin = nil
    else
      last_checkin = students.last
      last_checkin = last_checkin.split(",")
      last_checkin = last_checkin[0].to_i
      if Time.at(last_checkin).utc.day != Time.now.day
        last_checkin = nil
      end
    end
    return array
  end

  def findTimeDifference(time)
    time_difference = Time.at(time).utc.strftime("%H:%M:%S")
    return time_difference
  end
end