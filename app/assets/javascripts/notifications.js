function ready() {
  $(".notifications-list li").click(function(e) {
    var li = $(e.target).closest("li");
    if (li.children("a").length === 1) {
      var a = li.children("a")[0];
      a.click();  
    }
  });
}
$(document).ready(ready);
$(document).on('page:load', ready); // turbolinks friendly
