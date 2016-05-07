var ready = function() {
  $('.profile-dropdown-menu-button').click(toggleProfileMenu);
  $('.notifications-menu-button').click(toggleNotificationsMenu);
  $('body').click(hideDropdownMenuOnOtherClick);
};
$(document).ready(ready);
$(document).on('page:load', ready);

function toggleProfileMenu(event) {
  $('.notifications-list').removeClass('expanded-menu');
  $('.profile-dropdown-menu').toggleClass('expanded-menu'); 
}

function toggleNotificationsMenu(event) {
  $('.profile-dropdown-menu').removeClass('expanded-menu');
  $('.notifications-list').toggleClass('expanded-menu');
}

function hideDropdownMenuOnOtherClick(event) {
  if ($(event.target).closest('.dropdown-menu').length === 0 && $(event.target).closest('.dropdown-menu-button').length === 0) {
    $('.dropdown-menu').removeClass('expanded-menu');
  }
}

