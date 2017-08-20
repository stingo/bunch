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
        listLocation: "urbanterms",
        header: "<strong>Ghana Urban Terms</strong>",
      },

    

      {
        listLocation: "songs",
        header: "<strong>Songs</strong>",
      },

        {
        listLocation: "events",
        header: "<strong>Events</strong>",
      },

      
       {
        listLocation: "profiles",
        header: "<strong>People</strong>",
      },

    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    },
    theme: "plate-dark"
  }

  $input.easyAutocomplete(options)
});