(function() {
  $(function() {
    return $('[data-provider="summernote"]').each(function() {
      return $(this).summernote();
    });
  });

  $(document).ready(ready);

  $(document).on('turbolinks:load', ready);

}).call(this);
