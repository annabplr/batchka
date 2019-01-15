// image gallery
// init the state from the input
$(".stock-checkbox-ingindex").each(function () {
  if ($(this).find('input[type="checkbox"]').first().attr("checked")) {
    $(this).addClass('checkbox-boolean-ingindex');
  }
  else {
    $(this).removeClass('checkbox-boolean-ingindex');
  }
});

// sync the state to the input
$(".stock-checkbox-ingindex").on("click", function (e) {
  $(this).toggleClass('checkbox-boolean-ingindex');
  var $checkbox = $(this).find('input[type="checkbox"]');
  $checkbox.prop("checked",!$checkbox.prop("checked"))

  e.preventDefault();
});
