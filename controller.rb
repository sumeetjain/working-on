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