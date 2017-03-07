# Contains all functionality for time formatting.

class TimeFormatter
  def initialize(seconds)
    if seconds.kind_of?(Array)
      @seconds = seconds[0].to_i
    else
      @seconds = seconds.to_i
    end
  end

  # Accepts an Array of all dates available. Dates are in EPOCH integer format.
  #
  # Converts EPOCH integer into MM/DD/YY.
  # Removes duplicate date entries.
  #
  # Returns an Array of formatted dates.
  def parseDate
    Time.at(@seconds).strftime("%D")
  end

  # Converts array of EPOCH time into individual dates.
  #
  # Returns a unique list of available dates.
  def TimeFormatter.parseDates(array_of_epoch_time)
    list = array_of_epoch_time.map do |seconds|
      formatter = TimeFormatter.new(seconds)
      formatter.parseDate
    end

    list.uniq
  end

  # Converts an EPOCH time to H:M:S.
  # 
  # time - Integer of EPOCH time.
  # 
  # Returns String of the time amount as HH:MM:SS.
  def time_as_hms
    t = Time.at(@seconds).utc.strftime("%H:%M:%S")
    binding.pry
    return t
  end
end