window.onscroll = function() {
   	if (document.body.scrollTop + document.documentElement.scrollTop > 100) {
      // TODO Move all of this style into a CSS class, and use JS to
      // simply add and remove that class as needed.
   		document.getElementsByClassName("topbar")[0].style.position = "fixed"
   		document.getElementsByClassName("topbar")[0].style.top = "0"
   		document.getElementsByClassName("topbar")[0].style.left = "0"
   		document.getElementsByClassName("topbar")[0].style.width = "100%"
   	} else {
   		document.getElementsByClassName("topbar")[0].style.position = "static"
   	}
}