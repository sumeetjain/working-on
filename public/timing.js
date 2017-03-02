window.addEventListener("load", function(){
 	displayPosts();

 	setInterval(function() { displayPosts(); }, 10000);
});

function displayPosts() {
	var xhttp = new XMLHttpRequest();
	xhttp.open('GET', '/display')
  	xhttp.onload = function() {
    	var dailyPosts = JSON.parse(xhttp.responseText);
    	var top = document.getElementById("dailyFeed");
    	document.getElementById("dailyFeed").innerHTML = "";
    	for (x = 0; x < dailyPosts.length; x++) {
    		var html = "<div class=\"post thinbluebox\"><div class=\"postProfile\"><div class=\"postname\">" + dailyPosts[x][0] + "</div><div class=\"postdate\">" + dailyPosts[x][1] + "</div></div><div class=\"postsubmission\">" + dailyPosts[x][2] + "</div></div></div>";
    		top.insertAdjacentHTML("afterbegin", html);
    	}
  	};
  	xhttp.send();
}