class Admin

	def initialize(params)
		@user = params[:username]
		@pass = params[:password]
	end

	def check_valid_login
		login_database = $database.get_login_database
		login_database.each do |login|
			if login["username"].include?(@user)
				if login["password"].include?(@pass)
					return true
				else
					return false
				end
			else
				return false
			end
		end
	end
end