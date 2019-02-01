const displaymenus = document.getElementById("button-displaymenus");
if (displaymenus) {
  displaymenus.addEventListener("click", (event) => {
  event.currentTarget.nextElementSibling.classList.toggle("allmenus-display");
});
};

const displayideas = document.getElementById("button-displayideas");
if (displaymenus) {
  displayideas.addEventListener("click", (event) => {
  event.currentTarget.nextElementSibling.classList.toggle("allmenus-display");
});
};

