document.querySelectorAll(".button-displayplats").forEach((button) => {
  button.addEventListener("click", (event) => {
  event.currentTarget.nextElementSibling.classList.toggle("allplats-display");
});
});
