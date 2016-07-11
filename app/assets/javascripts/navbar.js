$(document).ready(function () {
  var scrollTop = $(document).scrollTop();

  if (scrollTop > 0){
    $('.navbar').addClass('navbar-fixed');
  } else {
    $('.navbar').removeClass('navbar-fixed-top')
  }

  $(document).scroll(function(e){
    var scrollTop = $(document).scrollTop();
    if(scrollTop > 0){
        console.log(scrollTop);
        $('.navbar').addClass('navbar-fixed');
    } else {
        $('.navbar').removeClass('navbar-fixed')
    }
  });
});
