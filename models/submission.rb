class Submission
  
  DATABASE = Database.new
  # Create a submission.
  # 
  # params - Hash of attributes for the submission to be created.
  #
  # Finds time differene between current post and previous post in EPOCH time.
  def create(params)
    student = Student.new(params[:name])
    new_submission = "#{Time.now.to_i},#{student.last_submission_at},#{params[:name]},#{params[:stressLevel]},#{params[:submission]}\n"
    DATABASE.add(new_submission)
  end

  # Gets all names available in database.
  def Submission.names
    DATABASE.get_items_by_header("name")
  end

  # Gets all dates available in database in EPOCH time.
  #
  # Converts EPOCH integer to MM/DD/YY.
  def Submission.dates
    array = DATABASE.get_items_by_header("time")
    TimeFormatter.parseDates(array)
  end
end