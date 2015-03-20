jQuery ->

  mainFunction = () ->
    $(document).keypress (e) ->
      key = e.which
      if key == 118
        # if the user pressed 't':
        $('body').toggleClass 'admin'
      return

    $( '.left_bar_show_btn' ).click ->
      $('body').toggleClass "left_admin_bar_show"
      $('.left_admin_bar').toggleClass "show"

  document.addEventListener("page:change", mainFunction);