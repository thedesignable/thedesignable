$(document).ready(function() {
      $("#client-carousel").owlCarousel({
          autoPlay: 3000, //Set AutoPlay to 3 seconds
          autoHeight: true,
          items : 3,
          itemsDesktop : [1199,3],
          itemsDesktopSmall : [979,3],
          lazyLoad : true,
          navigation: false   
      });
    });
