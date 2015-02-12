# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  # sorting on first page =========================
  catalogsFirstpageSorting = () ->
    $('.catalog_on_page').sortable
      helper:'clone'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))


  document.addEventListener("page:change", catalogsFirstpageSorting);