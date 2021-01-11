function HeightBackground(){
    height = $(window).height();
    $("#cover").css({
      "height" : height
    })
  }
  
  $(document).ready(function(){
    HeightBackground();
    $(window).resize(function(){
      HeightBackground();
    })
  })