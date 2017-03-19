window.addEventListener("load", function() {
	document.getElementById("adminKey").addEventListener("click", adminModal);
  document.getElementById("student_login_button").addEventListener("click", studentModal)
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

function studentModal() {
  document.getElementById("student_login_modal").style.display = "block";
  document.getElementById("student_modal_background").style.display = "block";
  document.getElementById("student_modal_background").addEventListener("click", closeModal);
  document.getElementById("student_close").addEventListener("click", closeModal);
}

function closeStudentModal() {
  document.getElementById("student_login_modal").style.display = "none";
  document.getElementById("student_modal_background").style.display = "none";
}