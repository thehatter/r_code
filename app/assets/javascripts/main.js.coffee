# jQuery ->

#   mainFunction = () ->
#     $(document).keypress (e) ->
#       key = e.which
#       if key == 118
#         # if the user pressed 't':
#         $('body').toggleClass 'admin'
#       return


#     $(document).on 'click', '.left_bar_show_btn', ->
#       $('body').toggleClass "left_admin_bar_show"
#       $('.left_admin_bar').toggleClass "show"




#   $(document).on('page:load', mainFunction);
#   $(document).on('page:change', mainFunction);

  # mainFunction1 = () ->
  #   console.log("widget name is: ")
  #   $("#edit_site_1").on("ajax:success", (e, data, status, xhr) ->
  #       console.log("widget name is: !!!!")
  #   ).on "ajax:error", (e, xhr, status, error) ->
  #       console.log("widget name is: ")

  # $(document).on('page:load', mainFunction1);
  # $(document).on('page:change', mainFunction1); 