class Submission
  
  DATABASE = Database.new

  # Create a submission.
  # 
  # params - Hash of attributes for the submission to be created.
  def create(params)
    time = Time.now.strftime("%a: %b %d: %I:%M:%P")
    new_submission = time + "," + params[:name] + "," + params[:submission] + "\n"
    DATABASE.add(new_submission)
  end

  # Get all submissions.
  # 
  # Returns an Array.
  def Submission.all
    DATABASE.everything(["time", "name", "submission"])
  end

end