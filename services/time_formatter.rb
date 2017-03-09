# Contains all functionality for time formatting.

class TimeFormatter
  def initialize(seconds)
      @seconds = seconds.to_i
  end

  # Accepts an integer of EPOCH time. Converts the EPOCH time to H:M:S.
  #
  # Returns String of the time amount as HH:MM:SS.
  def time_as_hms
    t = Time.at(@seconds).utc.strftime("%H:%M:%S")
    return t
  end
end