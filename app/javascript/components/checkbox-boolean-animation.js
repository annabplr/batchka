// image gallery
// init the state from the input
$(".stock-checkbox").each(function () {
  if ($(this).find('input[type="checkbox"]').first().attr("checked")) {
    $(this).addClass('checkbox-boolean');
  }
  else {
    $(this).removeClass('checkbox-boolean');
  }
});

// sync the state to the input
$(".stock-checkbox").on("click", function (e) {
  $(this).toggleClass('checkbox-boolean');
  var $checkbox = $(this).find('input[type="checkbox"]');
  $checkbox.prop("checked",!$checkbox.prop("checked"))

  e.preventDefault();
});
