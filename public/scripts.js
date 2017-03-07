window.onscroll = function() {
     	if (document.body.scrollTop + document.documentElement.scrollTop > 100) {
     		document.getElementById("topbarId").className = "stickyTop"
     	} else { 
     		document.getElementById("topbarId").className = "topbar";
     	}
     }