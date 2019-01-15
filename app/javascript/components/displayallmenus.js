const displaymenus = document.getElementById("button-displaymenus");
if (displaymenus) {
  displaymenus.addEventListener("click", (event) => {
  event.currentTarget.nextElementSibling.classList.toggle("allmenus-display");
});
};

