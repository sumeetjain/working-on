window.addEventListener("load", function() {
 setInterval(function() { displayPosts(); }, 10000); 
});

function displayPosts() {
	console.log("hi");
	page = document.getElementById("dailyFeed")
	html = "<%dailyPosts = Database.new%><%dailyPosts = dailyPosts.posts_today%><%dailyPosts.each do |post|%><div class =\"post\" ><div class = \"postProfile\"><div><%=post[0]%></div><div><%=post[1]%></div></div><div><div><%=post[2]%></div></div></div><%end%></div>";
	page.insertAdjacentHTML("afterbegin", page);
}