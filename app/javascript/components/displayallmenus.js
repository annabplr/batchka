const allmenus = document.getElementById("button-displaymenus");

allmenus.addEventListener("click", (event) => {
  event.currentTarget.nextElementSibling.classList.toggle("allmenus-display");
});

