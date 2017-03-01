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

  # Get all submissions.
  # 
  # Returns an Array.
  def Submission.all
    DATABASE.everything()
  end

end