class Student
  DATABASE = Database.new

  def initialize(name)
    @name = name
  end

  # Gets the time of the student's last checkin.
  # 
  # Returns Integer EPOCH time.
  def last_submission_at
    if last_submission.nil? || last_submission_was_not_today?
      return "first_of_day"
    else
      return time_as_hms(time_since_last_checkin)
    end
  end

  # Returns the student's last submission row String.
  def last_submission
    submissions = DATABASE.all_filtered("name", @name)

    submissions.last
  end 

  private

  # Returns Integer of seconds since last checkin.
  def time_since_last_checkin
    Time.now.to_i - last_checkin_at
  end

  # Returns Integer EPOCH time of last submission.
  def last_checkin_at
    last_submission.split(",")[0].to_i
  end

  # Checks to see if last student submission was NOT today.
  def last_submission_was_not_today?
    Time.at(last_checkin_at).utc.day != Time.now.day
  end

  # Converts an EPOCH time to H:M:S.
  # 
  # time - Integer of EPOCH time.
  # 
  # Returns String of the time amount as HH:MM:SS.
  def time_as_hms(time)
    Time.at(time).utc.strftime("%H:%M:%S")
  end
end