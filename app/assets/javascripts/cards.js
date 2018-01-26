$(document).on('turbolinks:load', function() {
  $('.card-image').on('dblclick', function() {
    $checkbox = $(this).siblings('input[type=checkbox]')
    $checkbox.prop('checked', false)
    $(this).closest('.column').remove()
  })
})
