$(document).on('turbolinks:load', function(){
  $('.ui.search.dropdown').dropdown({fullTextSearch: true});
  $('.ui.dropdown').dropdown();
  $('.menu .dropdown').dropdown();
  $('.ui.accordion').accordion();
})
