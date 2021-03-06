# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  catitemsSorting = () ->
    $('.category_catalog_items').sortable
      placeholder: "catalog_item col-md-4 col-lg-3"
      helper:'clone'
      handle:'.un_left_move'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))


  document.addEventListener("page:change", catitemsSorting);

  # sorting on first page =========================
  catitemsFirstpageSorting = () ->
    $('.catalog_catalog_items').sortable
      helper:'clone'
      handle:'.un_left_move'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))


  document.addEventListener("page:change", catitemsFirstpageSorting);
