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
  def add(table, columns, row)
    @conn.exec("INSERT INTO #{table} #{columns} VALUES (#{row})")
  end

  # Returns all data from the database based on a key, value pair.
  #
  # Returns an Array of row Strings.
  def all_by(table, key, value)
    list = []
    all_posts = @conn.exec("SELECT * FROM #{table} WHERE #{key}='#{value}'")
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
  def get_items_by_header(header, table)
    all_items = @conn.exec("SELECT #{header} FROM #{table}").map { |key| key.values[0] }
    return all_items.uniq
  end
  
  # Returns all data in the database.
  # 
  # Returns a Hash of table row data.
  def get_all_from_table(table)
    @conn.exec("SELECT * FROM #{table}")
  end
end