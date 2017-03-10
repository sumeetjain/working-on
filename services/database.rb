# TODO Make sure docs for methods correspond *exactly* to TomDoc.
#      Specifically for descriptions of each method's args.

# Contains all functionality for interacting with the database.

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
    all_posts = @conn.exec("SELECT * FROM #{table} WHERE #{key}='#{value}'")
  end

  # TODO Needs docs.
  #For a given table, returns
  def get_last(key1, key2, value, table)
    data = @conn.exec("SELECT #{key1} FROM #{table} WHERE #{key2}='#{value}' ORDER BY #{key1} DESC LIMIT 1")
    if data.ntuples != 0
      # TODO Fetch from `data` by `key` instead of by the 0-index.
      return data.values[0][0]
    else
      return nil
    end
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

  def table_item_by_col_and_val(col,table,key,val)
     all_posts = @conn.exec("SELECT #{col} FROM #{table} WHERE #{key}='#{val}'")
  end
  
  # Returns all data in the database.
  # 
  # Returns a Hash of table row data.
  def get_all_from_table(table)
    @conn.exec("SELECT * FROM #{table}")
  end

  # Inserts a value into a table for a particular column
  def insert_val_to_table_column(val, column, table)
    @conn.exec("INSERT INTO #{table} (#{column}) VALUES('#{val}')")
  end

  def erase_row_by_column_value(table, key, value)
    @conn.exec("DELETE FROM #{table} WHERE #{key}='#{value}'")
  end
end