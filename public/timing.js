window.addEventListener("load", function(){
  window.dailyFeed = document.getElementById("dailyFeed");

  displayPosts();

 	// setInterval(displayPosts, 10000);
});

function displayPosts() {
	var xhttp = new XMLHttpRequest();
	xhttp.open('GET', '/display');
  	
  xhttp.onload = function() {
    var dailyPosts = JSON.parse(xhttp.responseText);

    dailyFeed.innerHTML = "";
    
    for (i = 0; i < dailyPosts.length; i++) {
      var html = "<div class=\"post thinBox\"><div class=\"postProfile\"><div class=\"postname\">" + 
      dailyPosts[i][2] + "</div><div class=\"postdate\">" + dailyPosts[i][0] + 
      "</div></div><div class=\"postsubmission\">" + dailyPosts[i][4] + "</div></div></div>";

    dailyFeed.insertAdjacentHTML("afterbegin", html);
    }
  };

  xhttp.send();
}