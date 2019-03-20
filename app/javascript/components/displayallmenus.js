const displaymenus = document.getElementById("button-displaymenus");
if (displaymenus) {
  displaymenus.addEventListener("click", (event) => {
  event.currentTarget.nextElementSibling.classList.toggle("allmenus-display");
});
};

const displayideas = document.getElementById("button-displayideas");
if (displayideas) {
  displayideas.addEventListener("click", (event) => {
  event.currentTarget.nextElementSibling.classList.toggle("allmenus-display");
});
};

const displayduplicatemenu = document.getElementById("button-displayduplicatemenu");
if (displayduplicatemenu) {
  displayduplicatemenu.addEventListener("click", (event) => {
  event.currentTarget.nextElementSibling.classList.toggle("allmenus-display");
});
};

