# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  menuSorting = () ->
    $('.vertical_menu .config_menu_links').sortable
      axis: 'y'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
    $('.horizontal_menu .config_menu_links').sortable
      axis: 'x'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))


  document.addEventListener("page:change", menuSorting);

