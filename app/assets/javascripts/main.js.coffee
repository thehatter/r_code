jQuery ->

  mainFunction = () ->
    $(document).keypress (e) ->
      key = e.which
      if key == 118
        # if the user pressed 't':
        $('body').toggleClass 'admin'
      return


    $(document).on 'click', '.left_bar_show_btn', ->
      $('body').toggleClass "left_admin_bar_show"
      $('.left_admin_bar').toggleClass "show"




  $(document).on('page:load', mainFunction);
  $(document).on('page:change', mainFunction);