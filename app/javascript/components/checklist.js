document.querySelectorAll('div.todolist-form').forEach((item) => {
  item.addEventListener('click', (event) => {
    console.log(event);
    event.currentTarget.classList.toggle("display-check");

  });
});
