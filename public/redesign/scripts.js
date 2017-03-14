window.addEventListener("load", function() {
  document.getElementById("bottom_container-submit_button").addEventListener("click", happyWindow);
});

function happyWindow() {
  document.getElementById("smiley_modal").style.display = "block";
  document.getElementById("modal_background").style.display = "block";
  document.getElementById("modal_background").addEventListener("click", closeModal);
  document.getElementById("close").addEventListener("click", closeModal);
}

function closeModal() {
  document.getElementById("smiley_modal").style.display = "none";
  document.getElementById("modal_background").style.display = "none";
}