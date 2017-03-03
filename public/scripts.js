// Sets the window.scroll function to fix the 'topbar' div container to fixed
// at 100 pixels. Maybe need to write this to set to actual current height of
// topbar div (changes with window size).
window.onscroll = function() {
   	if (document.body.scrollTop + document.documentElement.scrollTop > 100) {
   		document.getElementsByClassName("topbar")[0].style.position = "fixed"
   		document.getElementsByClassName("topbar")[0].style.top = "0"
   		document.getElementsByClassName("topbar")[0].style.left = "0"
   		document.getElementsByClassName("topbar")[0].style.width = "100%"
   	} else {
   		document.getElementsByClassName("topbar")[0].style.position = "static"
   	}
}