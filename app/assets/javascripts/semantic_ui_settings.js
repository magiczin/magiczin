$(document).on('turbolinks:load', function(){
  $('.ui.search.dropdown').dropdown({fullTextSearch: true});
  $('.menu .dropdown').dropdown();
  $('.dropdown').dropdown();
})