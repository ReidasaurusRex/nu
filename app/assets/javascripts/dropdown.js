function ready() {
  $('#jsProfDropdownButton').click(toggleProfileMenu);
  $('#jsNotiDropdownButton').click(toggleNotificationsMenu);
  $('body').click(hideDropdownMenuOnOtherClick);
}
$(document).ready(ready);
$(document).on('page:load', ready); // turbolinks friendly

function toggleProfileMenu(event) {
  $('.c-noti-dropdown').removeClass('o-dropdown--is-open');
  $('.c-prof-dropdown').toggleClass('o-dropdown--is-open'); 
}

function toggleNotificationsMenu(event) {
  $('.c-prof-dropdown').removeClass('o-dropdown--is-open');
  $('.c-noti-dropdown').toggleClass('o-dropdown--is-open');
}

function hideDropdownMenuOnOtherClick(event) {
  if ($(event.target).closest('.o-dropdown').length === 0 && $(event.target).closest('.jsDropdownButton').length === 0) {
    $('.o-dropdown').removeClass('o-dropdown--is-open');
  }
}

