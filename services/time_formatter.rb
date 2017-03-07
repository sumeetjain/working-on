# Contains all functionality for time formatting.

# **Refactor opportunity
class TimeFormatter
  def initialize(seconds)
    if seconds.kind_of?(Array)
      @seconds = seconds[0].to_i
    else
      @seconds = seconds.to_i
    end
  end

  # Accepts an Array of EPOCH integers. Converts array of EPOCH time into individual dates.
  #
  # Returns an Array of unique dates.
  def TimeFormatter.parseDates(array_of_epoch_time)
    list = array_of_epoch_time.map do |seconds|
      formatter = TimeFormatter.new(seconds)
      formatter.parseDate
    end

    list.uniq
  end

  # Converts EPOCH integer into MM/DD/YY.
  def parseDate
    Time.at(@seconds).strftime("%D")
  end

  # Accepts an integer of EPOCH time. Converts the EPOCH time to H:M:S.
  #
  # Returns String of the time amount as HH:MM:SS.
  def time_as_hms
    t = Time.at(@seconds).utc.strftime("%H:%M:%S")
    return t
  end
end