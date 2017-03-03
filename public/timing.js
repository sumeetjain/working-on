window.addEventListener("load", function(){
    displayPosts();
    setInterval(function() { displayPosts(); }, 10000);
});

//  sends request to server for data, parses array of daily posts to JSON
//
//  calls function to plug HTML into the page for all the posts in JSON
function displayPosts() {
    var xhttp = new XMLHttpRequest();
    xhttp.open('GET', '/display')
    xhttp.onload = function() {
        var dailyPosts = JSON.parse(xhttp.responseText);
        var feed = document.getElementById("dailyFeed");
        feed.innerHTML = "";
    plugXpostsToFeed(dailyPosts,feed);
    };
    xhttp.send();
}

//  takes an array of posts, for each post constructs its HTML
//
//  result is to insert formatted messages into the dailyFeed div on index.erb
function plugXpostsToFeed(postArray, feedNode) {
    for (x = 0; x < postArray.length; x++) {
      var html = "<div class=\"post thinbluebox\"><div class=\"postProfile\"><div class=\"postname\">" + 
      postArray[x][0] + "</div><div class=\"postdate\">" + 
      postArray[x][1] + "</div></div><div class=\"postsubmission\">" + 
      postArray[x][2] + "</div></div></div>";
      feedNode.insertAdjacentHTML("afterbegin", html);
  }
}