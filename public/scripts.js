window.onscroll = function() {
   	if (document.body.scrollTop + document.documentElement.scrollTop > 0) {
   		document.getElementsByClassName("topbar")[0].style.position = "fixed"
   		document.getElementsByClassName("topbar")[0].style.top = "0"
   		document.getElementsByClassName("topbar")[0].style.left = "0"
   		document.getElementsByClassName("topbar")[0].style.width = "100%"
   	} else {
   		document.getElementsByClassName("topbar")[0].style.position = "static"
   	}
}