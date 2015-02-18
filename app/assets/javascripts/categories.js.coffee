# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  # sorting in menu =========================
  catSorting = () ->
    $('.catalog_categoryes').sortable
      axis: 'y'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))


  document.addEventListener("page:change", catSorting);


  # sorting on first page =========================
  catFirstpageSorting = () ->
    $('.big_catalog_categoryes').sortable
      helper:'clone'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))


  document.addEventListener("page:change", catFirstpageSorting);
