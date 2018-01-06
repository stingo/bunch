$(document).on "turbolinks:load", ->
   $('#upfrica-pins-music').imagesLoaded ->
     $('#upfrica-pins-music').masonry
       itemSelector: '.boxmusic'
       isFitWidth: true