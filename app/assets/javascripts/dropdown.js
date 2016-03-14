var ready = function() {
  var counter = 0;
  $(".dropdown-menu-button").click(function(event) {
    counter ++;
    console.log("Counter at: " + counter);
    $(".dropdown-menu").toggleClass("expanded-menu");
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);