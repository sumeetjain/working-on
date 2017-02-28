get "/" do
  erb :index
end

post "/submit" do
  submission = Submission.new
  submission.create(params)
  redirect("/display")
end

get "/display" do
  @submissions = Submission.all
  erb :display
end