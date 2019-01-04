document.querySelectorAll('div.button_edit_ingredient').forEach((ingredient) => {
  ingredient.addEventListener('click', (event) => {
    if (ingredient.nextElementSibling.style.display === "none") {
      ingredient.nextElementSibling.style.display = "block";
    } else {
    ingredient.nextElementSibling.style.display = "none";
  }
  });
});
