jQuery(function() {

  jQuery.fn.verticalCenter = function () {
      this.css("position","absolute");
      this.css("top", "50%");

      var elementHeight = this.height();
      var elementHeight = (-elementHeight / 2)
      this.css("margin-top",  elementHeight);

      // console.log(elementHeight);

      return this;
  }


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


  };



  $(document).on('page:load', mainFunction);
  $(document).on('page:change', mainFunction);
});

