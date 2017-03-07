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
  # row - String to append. "nama, sekng, kjg"
  def add(row)
    @conn.exec("INSERT INTO submissions (date, time, interval, name, stressLevel, submission) VALUES (#{row})")
  end

  # Returns all data in the CSV.
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

  # Get all rows through a particular filter.
  # 
  # Returns an Array of row Strings.
  # def all_filtered(filter)
  #   list = []
  #   CSV.foreach(@file, {headers:true}) do |row|
  #     if filter.call(row) == true
  #       list << row.to_s
  #     end
  #   end

  #   return list
  # end

  def all_by(key, value)
    list = []
    all_posts = @conn.exec("SELECT * FROM submissions WHERE #{key}='#{value}'")
    all_posts.each do |row|
      list << row.values.join(",")
    end
    return list
  end

  # Get all rows based on a requested header value
  #
  # Removes duplicate entries.
  #
  # Returns an Array of Strings.
  def get_items_by_header(header)
    list = []
    all_items = @conn.exec("SELECT #{header} FROM submissons WHERE **")

    return list.uniq
  end
end