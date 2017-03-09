class Admin

	def initialize(params)
		@user = params[:username]
		@pass = params[:password]
	end

	# Checks is username and password exist together in the admin table.
	#
	# Returns true/false boolean.
	def check_valid_login
		# TODO Refactor this like so...
		# $database.all_with_two_matches("admin", 
		#   {"username" => @user, "password" => @pass})
		
		login_database = $database.get_all_from_table("admin")
		login_status = false
		login_database.each do |login|
			if login["username"].include?(@user) && login["password"].include?(@pass)
				login_status = true
			end
		end
		return login_status
	end
end