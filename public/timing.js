window.addEventListener("load", function(){
  window.dailyFeed = document.getElementById("dailyFeed");

  displayPosts();

 	// setInterval(displayPosts, 10000);
});

//  sends request to server for data, parses array of daily posts to JSON
//
//  calls function to plug HTML into the page for all the posts in JSON
function displayPosts() {
	var xhttp = new XMLHttpRequest();
	xhttp.open('GET', '/display');
  	
  xhttp.onload = function() {
    var dailyPosts = JSON.parse(xhttp.responseText);
    debugger;
    dailyFeed.innerHTML = "";
    
    for (x = 0; x < dailyPosts.length; x++) {
      post = dailyPosts[x].split(",")
      var html = "<div class=\"post thinBox\"><div class=\"postProfile\"><div class=\"postname\">" + post[0] + "</div><div class=\"postdate\">" + post[1] + "</div></div><div class=\"postsubmission\">" + post[2] + "</div></div></div>";

    dailyFeed.insertAdjacentHTML("afterbegin", html);
   }
  };

  xhttp.send();
}