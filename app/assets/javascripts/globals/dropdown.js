function ready() {
  $('#jsProfDropdownButton').click(toggleProfileMenu);
  $('#jsNotiDropdownButton').click(toggleNotificationsMenu);
  $('body').click(hideDropdownMenuOnOtherClick);
}
$(document).ready(ready);
$(document).on('page:load', ready); // turbolinks friendly

function toggleProfileMenu(event) {
  console.log(event);
  $('.c-noti-dropdown').removeClass('o-dropdown--is-open');
  $('.c-prof-dropdown').toggleClass('o-dropdown--is-open'); 
}

function toggleNotificationsMenu(event) {
  console.log(event);
  $('.c-prof-dropdown').removeClass('o-dropdown--is-open');
  $('.c-noti-dropdown').toggleClass('o-dropdown--is-open');
}

function hideDropdownMenuOnOtherClick(event) {
  if ($(event.target).closest('.dropdown-menu').length === 0 && $(event.target).closest('.dropdown-menu-button').length === 0) {
    $('.o-dropdown-menu').removeClass('o-dropdown--is-open');
  }
}

