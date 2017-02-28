get "/" do
	@login = session["login"]
	erb :index
end

post "/submit" do
	session["login"] = params["name"]
  submission = Submission.new
  submission.create(params)
  redirect("/display")
end

get "/display" do
  @submissions = Submission.all
  erb :display
end

post "/verify" do 
	if params["loginName"] = "Sumeet"||"Alex"
		redirect to("/admin")
	else
		redirect to("/")
	end
end

get "/admin" do
	@submissions=Submission.all
	erb :admin
end