document.querySelectorAll('div.button_edit_ingredient').forEach((ingredient) => {
  ingredient.addEventListener('click', (event) => {
    if (document.querySelector("div.form_edit_ingredient").style.display === "none") {
      document.querySelector("div.form_edit_ingredient").style.display = "block";
    } else {
    document.querySelector("div.form_edit_ingredient").style.display = "none";
  }
  });
});
