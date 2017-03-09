# Contains all functionality for interacting with the database.

# Here are some specific things the Database class should NOT know about:
# 
# 1. It should not have any hard-coded table names.
# 2. It should not have any hard-coded column names.
# 3. Even if a function in this class is only used once somewhere else, that 
#    function should still be generically written so it could be used in other
#    contexts. E.g. a `users_rows` function would be better as a 
#    `rows_where_key_is_value(key, value)` function, since that satisfies the
#    specific requirement and can be re-used in other contexts.

class Database

  def initialize(db_name='working_on_development')
    @conn = PG.connect( dbname: db_name )
  end

  # Adds a row to the database.
  # 
  # row - String to append.
  def add(row)
    @conn.exec("INSERT INTO submissions (date, time, interval, name, stressLevel, submission) VALUES (#{row})")
  end

  # Returns all data from the database based on a key, value pair.
  #
  # Returns an Array of row Strings.
  def all_by(key, value)
    list = []
    all_posts = @conn.exec("SELECT * FROM submissions WHERE #{key}='#{value}'")
    all_posts.each do |row|
      list << row.values.join(",")
    end
    return list
  end

  # Get all rows based on a requested header value (EX: header => "names" only returns all names)
  #
  # Removes duplicate entries.
  #
  # Returns an Array of Strings.
  def get_items_by_header(header)
    list = []
    all_items = @conn.exec("SELECT #{header} FROM submissions")
    all_items.each do |row|
      list << row.values
    end
    return list.uniq
  end

  # Get all rows based on a requested header value (EX: header => "names" only returns all names)
  #
  # Removes duplicate entries.
  #
  # Returns an Array of Strings.
  def table_items_by_header(header, table)
    list = []
    all_items = @conn.exec("SELECT #{header} FROM #{table}")
    all_items.each do |row|
      list << row.values[0]
    end
    return list.uniq
  end

  def erase_row_by_column_value(val,col, table)
    @conn.exec("DELETE FROM #{table} WHERE #{col}='#{val}' ")
  end

  def get_login_database
    login_items = @conn.exec("SELECT * FROM admin")
  end

  # Returns all data in the database. ** NOT CURRENTLY USED
  # 
  # Reurns an Array of row Strings.
  def all
    all_posts = @conn.exec("SELECT * FROM submissions")
    post_array = []
    all_posts.each do |row| 
      post_array.push(row.values.join(","))
    end
    return post_array
  end

  def insert_val_to_table_column(val, column, table)
    @conn.exec("INSERT INTO #{table} (#{column}) VALUES('#{val}')")
  end
end