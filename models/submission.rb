class Submission
  
  DATABASE = Database.new

  # Create a submission.
  # 
  # params - Hash of attributes for the submission to be created.
  def create(params)
    time_interval = DATABASE.getPreviousEntry(params[:name]).to_i
    time = Time.now.to_i
    if time_interval != 0
      time_interval = time - time_interval
      time_difference = DATABASE.findTimeDifference(time_interval)
      new_submission = time.to_s + "," + time_difference + "," + params[:name] + "," + params[:stressLevel] + "," + params[:submission] + "\n"
    else
      new_submission = time.to_s + ",first_of_day," + params[:name] + "," + params[:stressLevel] + "," + params[:submission] + "\n"
    end
    DATABASE.add(new_submission)
  end

  # Get all submissions.
  # 
  # Returns an Array.
  def Submission.all
    DATABASE.everything(["time", "interval", "name", "stressLevel", "submission"])
  end

  # Get all submissions.
  #
  # Returns a Hash.
  def Submission.hashAll
    DATABASE.everything([time: "time", interval: "interval", name:"name", stressLevel:"stressLevel", submission:"submission"])
  end

end