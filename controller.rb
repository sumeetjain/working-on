#displays index.erb the mainpaige of the website

get "/" do
	@login = session["login"]
	erb :index
end

# session["login"] creates a cookie that will keep track of the user.  Creates a new submission
# class object, and adds the value set (params) gotten from 


post "/submit" do
	session["login"] = params["name"]
  	submission = Submission.new
  	submission.create(params)
  	redirect("/display")
end

get "/display" do
  	@submissions = Submission.all
  	binding.pry
end