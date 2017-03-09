class Admin

	def initialize(params)
		@user = params[:username]
		@pass = params[:password]
	end

	# Checks is username and password exist together in the admin table.
	#
	# Returns true/false boolean.
	def check_valid_login
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