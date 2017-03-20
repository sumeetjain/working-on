window.addEventListener("load", function() {
  document.getElementById("admin_button").addEventListener("click", openModal);
});

function openModal() {
  document.getElementById("admin_modal").style.display = "block";
  document.getElementById("modal_background").style.display = "block";
  document.getElementById("modal_background").addEventListener("click", closeModal);
  document.getElementById("close").addEventListener("click", closeModal);
}

function closeModal() {
  document.getElementById("admin_modal").style.display = "none";
  document.getElementById("modal_background").style.display = "none";
}