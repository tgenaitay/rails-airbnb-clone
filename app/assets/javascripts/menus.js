// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $(".navbar-wagon-search-input").on("click", function(event){
      $(".navbar-wagon-search-input").val("");
  });

  $( "#portions" ).change(function() {
    $( ".little-searchbar" ).submit();
  });

  $( "#price" ).change(function() {
    $( ".little-searchbar" ).submit();
  });

});

