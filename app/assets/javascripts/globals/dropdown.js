function ready() {
  $('#jsProfDropdownButton').click(toggleProfileMenu);
  $('.notifications-menu-button').click(toggleNotificationsMenu);
  $('body').click(hideDropdownMenuOnOtherClick);
}
$(document).ready(ready);
$(document).on('page:load', ready); // turbolinks friendly

function toggleProfileMenu(event) {
  console.log(event);
  $('.notifications-list').removeClass('o-dropdown--is-open');
  $('.c-prof-dropdown').toggleClass('o-dropdown--is-open'); 
}

function toggleNotificationsMenu(event) {
  $('.profile-dropdown-menu').removeClass('o-dropdown--is-open');
  $('.notifications-list').toggleClass('o-dropdown--is-open');
}

function hideDropdownMenuOnOtherClick(event) {
  if ($(event.target).closest('.dropdown-menu').length === 0 && $(event.target).closest('.dropdown-menu-button').length === 0) {
    $('.dropdown-menu').removeClass('o-dropdown--is-open');
  }
}

