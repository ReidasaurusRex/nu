var ready = function() {
  var counter = 0;
  $(".dropdown-menu-button").click(function(event) {
    $(".dropdown-menu").toggleClass("expanded-menu");
  });
  $(".main-body").click(function(event) {
    $(".dropdown-menu").removeClass("expanded-menu");
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);