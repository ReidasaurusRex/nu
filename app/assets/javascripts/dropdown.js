var ready = function() {
  var counter = 0;
  $(".drop-down-menu-button").click(function(event) {
    counter ++;
    console.log("Counter at: " + counter);
    $(".drop-down-menu").toggleClass("expanded-menu");
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);