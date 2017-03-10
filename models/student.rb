# Contains all functionality relating to student tracking.

class Student

  def initialize(name_or_id)
    if name_or_id.class == Fixnum
      @id = name_or_id
      @name = self.getName
    elsif 
      @name = name_or_id
        if self.valid?
          self.save
          @id = self.getKey
        end
    end
  end

  # Returns a String with the name of the student.
  def Student.get_name(id)
    # TODO Write the SQL.
    "Sumeet Jain"
  end

  attr_reader :name, :id

  # Saves the Student record.
  def save
    if valid?
      $database.insert_val_to_table_column(@name, 'name', 'students')
    end
  end

  # Returns True if the record is valid and OK to save.
  def valid?
    name_is_new? && @name.class == String
  end

  # Deletes this student.
  def remove
    $database.erase_row_by_column_value(@name,'name', 'students')
  end

  # Retrieves key corresponding to name column in students table
  def getName
    $database.table_item_by_col_and_val('name','students','id',@id)[0]["name"]
  end

  # Retrieves key as a class method for convenience to save 4 characters
  def Student.getName(id)
    $database.table_item_by_col_and_val('name','students','id',id)[0]["name"]
  end

  # Retrieves key corresponding to name column in students table
  def getKey
    $database.table_item_by_col_and_val('id','students','name',@name)[0]["id"]
  end

  # Retrieves key as a class method for convenience to save 4 characters
  def Student.getKey(a_name)
    $database.table_item_by_col_and_val('id','students','name',a_name)[0]["id"]
  end

  # Gets the time of the student's last checkin.
  # 
  # Returns Integer EPOCH time.
  def last_submission_at
    if last_submission.nil? || last_submission_was_not_today?
      return "first_of_day"
    else
      formatter = TimeFormatter.new(time_since_last_checkin)
      return formatter.time_as_hms
    end
  end

  # Returns the student's last EPOCH Time.
  def last_submission
    $database.get_last("time","id",@id,"submissions")
  end 

  private

  # Returns Integer of seconds since last checkin.
  def time_since_last_checkin
    Time.now.to_i - last_checkin_at
  end

  # Returns Integer EPOCH time of last submission.
  def last_checkin_at
    last_submission.to_i
  end

  # Checks to see if last student submission was NOT today.
  def last_submission_was_not_today?
    Time.at(last_checkin_at).utc.day != Time.now.day
  end

  # Returns True if this student's name is unique.
  def name_is_new?
    return !($database.get_items_by_header('name','students').include? @name)
  end
end