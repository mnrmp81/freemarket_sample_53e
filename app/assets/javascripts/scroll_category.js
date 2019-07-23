$(document).on('turbolinks:load', function() {  

  $(function() {
    $('.category__nav').hover(function() {
      $(this).css("background-color", "red");
      $(this).children().children().css("color", "white");
    }, function() {
      $(this).css("background-color", "white");
      $(this).children().children().css("color", "black");
    });
  });

  $(function(){
    $('a[href^="#"]').click(function(){
      var speed = 400;
      var href = $(this).attr("href");
      var target = $(href == "#" || href == "" ? 'html':href);
      var position = target.offset().top;
      $('body,html').animate({scrollTop:position}, speed, 'swing');
      return false;
    });
  });

});
