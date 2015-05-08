jQuery(function() {



  Dropzone.autoDiscover = false; //turn off auto discover dropzones
  
  $(function() {
    if ($("#media-dropzone").length) {
        var mediaDropzone;
        mediaDropzone = new Dropzone("#media-dropzone");
        return mediaDropzone.on("success", function(file, responseText) {
          var imageUrl;
          var _this = this;
          imageUrl = responseText.file_name.url;
          console.log(responseText);

          appendContent(responseText.file_name.url, responseText.id);
          setTimeout(function(){
            _this.removeAllFiles();
          },1000);
        });
    }

  });


  var appendContent = function(imageUrl, mediaId) {
    var outputLink = addThumbPrefix(imageUrl);
    console.log(outputLink);
    $(".multiple_img_holder").append('<div class="multiple_img_item">' + 
        '<img src="' + outputLink + '"/>' +
        '<a class="un_nav_btn un_btn_delete" href="/up_files/'+ mediaId +'" data-method="delete" rel="nofollow" data-remote="true" title="Удалить картинку"></a>'+
      '</div>');

    BindImageDeleting();
  };

  //getting imageUrl with thumb_ prefix
  var addThumbPrefix = function (url) { 
    var lastSlashIndex = url.lastIndexOf('/');
    var positionForPrefix = lastSlashIndex+1;
    var preFix = "thumb_";
    var output = [url.slice(0, positionForPrefix), preFix, url.slice(positionForPrefix)].join('');
    return output;
  }

  // image deletions
  function BindImageDeleting() {
    $('.multiple_img_holder .un_btn_delete').bind('ajax:success', function() {  
          $(this).closest('div').fadeOut();
    });  
  }

  $( document ).ready(function() {
    BindImageDeleting();
  });

});