# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
   $('#upfrica-pins').imagesLoaded ->
     $('#upfrica-pins').masonry
       itemSelector: '.box'
       isFitWidth: true
