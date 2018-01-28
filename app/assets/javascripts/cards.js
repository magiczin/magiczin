$(document).on('turbolinks:load', function() {
  $('.card-image').on('dblclick', function() {
    var id = $(this).parent('.card').data('id')
    var sidebarDataId = '[data-id="' + id + '"]'
    var $sidebarCard = $('.side-deck' + sidebarDataId)

    $checkbox = $(this).siblings('input[type=checkbox]')
    $checkbox.prop('checked', false)
    $(this).closest('.column').remove()
    $sidebarCard.appendTo('.junk.menu')
    $sidebarCard.removeClass('side-deck')
    $sidebarCard.addClass('junk-deck')
  })
})
