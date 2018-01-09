$(document).on "turbolinks:load", ->
   $('#upfrica-pins').imagesLoaded ->
     $('#upfrica-pins').masonry
       itemSelector: '.box'
       isFitWidth: true