# Contains all functionality relating to the submission of posts.

class Submission
  def initialize
    @table = "submissions"
    @columns = "(date, time, interval, name, stressLevel, submission)"
  end
  # Create a submission.
  # 
  # params - Hash of attributes for the submission to be created.
  #
  # Finds time difference between current post and previous post in EPOCH time.
  def create(params)
    student = Student.new(params[:name])
    if student.name_is_new
      student.addname
    end
    submission = params[:submission].gsub("'", "''").gsub(",", "")
    new_submission = "'#{Time.now.strftime("%x")}','#{Time.now.to_i}','#{student.last_submission_at}','#{params[:name]}',#{params[:stressLevel]},'#{submission}'"
    $database.add(@table, @columns, new_submission)
  end

  # Gets all names available in database.
  #
  # Used for printing out list of available names to search in dropdown box on Admin page.
  def Submission.names
    $database.get_items_by_header("name", "submissions")
  end

  # Gets all dates available in database.
  #
  # Used for printing out list of available dates to search in dropdown box on Admin page.
  def Submission.dates
    array = $database.get_items_by_header("date", "submissions")
  end
end