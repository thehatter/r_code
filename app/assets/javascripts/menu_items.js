jQuery(function() {

$( document ).ready(function() {
    $(".admin .config_menu_links").draggable;
    $(".menu_links").droppable({
       drop: function(event, ui) {
           // do something with the dock
           //$(this).doSomething();

           // do something with the draggable item
           //$(ui.draggable).doSomething();
           console.log($(ui.draggable));
           console.log($(this).attr("data-menu-id"));
           $.ajax({
             url: "/menu_items/change_menu/" + $(ui.draggable).attr("data-id"),
             type: "POST",
             dataType: "json",
             data: {"menu_id": $(this).attr("data-menu-id")}
           }).done(function(){
             console.log("ajax_ok!");
           });
         }
    });
});

});
