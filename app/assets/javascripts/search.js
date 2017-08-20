document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },

    categories: [
      {

        


        listLocation: "hows",
        header: "<strong>Hows</strong>",
      },

    

      {
        listLocation: "songs",
        header: "<strong>SONGS</strong>",
      },

        {
        listLocation: "events",
        header: "<strong>EVENTS</strong>",
      },
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    },
    theme: ""
  }

  $input.easyAutocomplete(options)
});