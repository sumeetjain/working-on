window.addEventListener("load", function(){
  window.dailyFeed = document.getElementById("middle_container");

  displayPosts();
  setInterval(displayPosts, 10000);
});

//  sends request to server for data, parses array of daily posts to JSON
//
//  calls function to plug HTML into the page for all the posts in JSON
function displayPosts() {
	var xhttp = new XMLHttpRequest();
	xhttp.open('GET', '/display');
  	
  xhttp.onload = function() {
    var dailyPosts = JSON.parse(xhttp.responseText);
    dailyFeed.innerHTML = "";
    
    for (x = 0; x < dailyPosts.length; x++) {
      post = dailyPosts[x].split(",")
      var html = "<div class=\"post_container\"><div class=\"post_container-left\"><img src=\"https://github.com/" + post[3] + ".png\" class=\"profilePhoto\"></div><div class=\"post_container-right\"><div class=\"post_container-header\"><span class=\"post_container-header_name\">" + post[0] + "</span><span class=\"post_container-header_date\">" + post[1] + "</span></div><div class=\"post_container-content\">" + post[2] + "</div></div></div>";
      dailyFeed.insertAdjacentHTML("afterbegin", html);
    }
    logout_html = "<a href=\"/reset\" id=\"student_logout\">Logout as Current Student</a>";
    dailyFeed.insertAdjacentHTML("beforeend", logout_html);
  }
  xhttp.send();
}