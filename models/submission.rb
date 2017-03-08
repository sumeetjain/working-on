# Contains all functionality relating to the submission of posts.

class Submission
  # Create a submission.
  # 
  # params - Hash of attributes for the submission to be created.
  #
  # Finds time difference between current post and previous post in EPOCH time.
  def create(params)
    student = Student.new(params[:name])
    student.addname
    new_submission = "'#{Time.now.strftime("%x")}','#{Time.now.to_i}','#{student.last_submission_at}','#{params[:name]}',#{params[:stressLevel]},'#{params[:submission]}'"
    $database.add(new_submission)
  end

  # Gets all names available in database.
  #
  # Used for printing out list of available names to search in dropdown box on Admin page.
  def Submission.names
    names = $database.get_items_by_header("name")
    newnames = []
    names.each do |name|
      newnames << name[0]
    end
    return newnames
  end

  # Gets all dates available in database in EPOCH time.
  #
  # Converts EPOCH integer to MM/DD/YY.
  #
  # Used for printing out list of available dates to search in dropdown box on Admin page.
  def Submission.dates
    array = $database.get_items_by_header("time")
    TimeFormatter.parseDates(array)
  end
end