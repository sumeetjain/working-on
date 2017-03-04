window.addEventListener("load", function(){
<<<<<<< HEAD
 	displayPosts();

  dailyFeed = document.getElementById("dailyFeed");


=======
  window.dailyFeed = document.getElementById("dailyFeed");
  displayPosts();
>>>>>>> 8181b29b69ddaa8a762c7aa0845b73c27a20c8ff
 	setInterval(displayPosts, 10000);
});

function displayPosts() {
	var xhttp = new XMLHttpRequest();
	xhttp.open('GET', '/display');
  	
  xhttp.onload = function() {
    var dailyPosts = JSON.parse(xhttp.responseText);

    dailyFeed.innerHTML = "";
    
    for (x = 0; x < dailyPosts.length; x++) {
      var html = "<div class=\"post thinBox\"><div class=\"postProfile\"><div class=\"postname\">" + dailyPosts[x][0] + "</div><div class=\"postdate\">" + dailyPosts[x][1] + "</div></div><div class=\"postsubmission\">" + dailyPosts[x][2] + "</div></div></div>";

<<<<<<< HEAD
    	dailyFeed.insertAdjacentHTML("afterbegin", html);
=======
    dailyFeed.insertAdjacentHTML("afterbegin", html);
>>>>>>> 8181b29b69ddaa8a762c7aa0845b73c27a20c8ff
    }
  };

  xhttp.send();
}