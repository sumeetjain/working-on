# Contains all functionality relating to student tracking.

class Student

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
      formatter = TimeFormatter.new(time_since_last_checkin)
      return formatter.time_as_hms
    end
  end

  # Returns the student's last submission row String.
  def last_submission
    submissions = $database.all_by("name", @name)
    submissions.last
  end 

  private

  # Returns Integer of seconds since last checkin.
  def time_since_last_checkin
    Time.now.to_i - last_checkin_at
  end

  # Returns Integer EPOCH time of last submission.
  def last_checkin_at
    last_submission.split(",")[1].to_i
  end

  # Checks to see if last student submission was NOT today.
  def last_submission_was_not_today?
    Time.at(last_checkin_at).utc.day != Time.now.day
  end
end