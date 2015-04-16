// jQuery.ajaxSetup({
//   dataType: 'json'
// });

jQuery(function() {

  jQuery.fn.verticalCenter = function () {
      this.css("position","absolute");
      this.css("top", "50%");

      var elementHeight = this.outerHeight();
      var elementHeight = (-elementHeight / 2)
      this.css("margin-top",  elementHeight);

      // console.log(elementHeight);

      return this;
  }



  $( document ).ready(function() {
  
    console.log( "ready!" );
    // site settings ajax indication
    $(".left_admin_bar_in form.edit_site").on("ajax:success", function(e, data, status, xhr) {
      $('.left_admin_bar').toggleClass('grean');  
      setTimeout(function(){
       // toggle back after 1 second
        $('.left_admin_bar').toggleClass('grean');  
      },2000);
      console.log("site conf success");
    }).on("ajax:error", function(e, xhr, status, error) {
      $('.left_admin_bar').toggleClass('red');  
      setTimeout(function(){
       // toggle back after 1 second
        $('.left_admin_bar').toggleClass('grean');  
      },2000);
      console.log("erorr in site conf!");
    });

  });

  var mainFunction;
  mainFunction = function() {


    $('.logo_container').verticalCenter();

    // $(document).keypress(function(e) {
    //   var key;
    //   key = e.which;
    //   if (key === 118) {
    //     $('body').toggleClass('admin');
    //   }
    // });

    $(document).on('click', '.left_bar_show_btn', function() {
      $('body').toggleClass("left_admin_bar_show");
      $('.left_admin_bar').toggleClass("show");
    });

    $('a[data-toggle="tooltip"]').tooltip({
      animated : 'fade',
      placement : 'bottom',
      container: 'a'
    });

    console.log("test");





  };



  $(document).on('page:load', mainFunction);
  $(document).on('page:change', mainFunction);
});

