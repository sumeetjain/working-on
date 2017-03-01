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

  # Gets previous entry of the student submitting.
  #
  # Finds an array of all student entries in CSV and splits out last entry.
  #
  # Returns the time of the last entry, or nil if student is new or last entry was yesterday.
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

  # Converts the EPOCH time difference between new post and last post to H:M:S.
  def findTimeDifference(time)
    time_difference = Time.at(time).utc.strftime("%H:%M:%S")
    return time_difference
  end
end