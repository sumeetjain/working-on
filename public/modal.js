window.addEventListener("load", function() {
	document.getElementById("adminKey").addEventListener("click", adminModal);
});

function adminModal() {
	document.getElementById("admin_login_modal").style.display = "block";
	document.getElementById("modal_background").style.display = "block";
	document.getElementById("modal_background").addEventListener("click", closeModal);
	document.getElementById("close").addEventListener("click", closeModal);
}

function closeModal() {
	document.getElementById("admin_login_modal").style.display = "none";
	document.getElementById("modal_background").style.display = "none";
}