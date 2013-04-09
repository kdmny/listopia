$(function(){
  $(".listopia-rm").on("ajax:success", function(e){
    $(e.target).parent().fadeOut().remove();
  });
});