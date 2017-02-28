class Submission
  def initialize
    set_database
  end

  def set_database
    @database = Database.new
  end

  # Create a submission.
  # 
  # params - Hash of attributes for the submission to be created.
  def create(params)
    time = Time.now.strftime("%a: %b %d: %I:%M:%P")
    new_submission = time + "," + params[:name] + "," + params[:submission] + "\n"
    @database.add(new_submission)
  end
end