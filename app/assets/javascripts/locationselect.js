$(document).on("turbolinks:load", function() {
  var selectizeCallback = null;

  $(".location-modal").on("hide.bs.modal", function(e) {
    if (selectizeCallback != null) {
      selectizeCallback();
      selecitzeCallback = null;
    }

    $("#new_location").trigger("reset");
    $.rails.enableFormElements($("#new_location"));
  });

  $("#new_location").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      method: "POST",
      url: $(this).attr("action"),
      data: $(this).serialize(),
      success: function(response) {
        selectizeCallback({value: response.id, text: response.name});
        selectizeCallback = null;

        $(".location-modal").modal('toggle');
        
      }
    });
  });

  $(".selectize").selectize({
    create: function(input, callback) {
      selectizeCallback = callback;

      $(".location-modal").modal();
      $("#location_name").val(input);
    }
  });
});
