var ready = function() {
  var counter = 0;
  $(".profile-dropdown-menu-button").click(function(event) {
    $(".profile-dropdown-menu").toggleClass("expanded-menu");
  });
  $(".notifications-menu-button").click(function(event) {
    $(".notifications-list").toggleClass("expanded-menu");
  });
  $(".main-body").click(function(event) {
    $(".dropdown-menu").removeClass("expanded-menu");
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);