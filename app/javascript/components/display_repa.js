document.querySelectorAll('div.display_repa').forEach((repa) => {
  repa.addEventListener('click', (event) => {
    event.currentTarget.classList.toggle("display_repa_detail");
  });
});
