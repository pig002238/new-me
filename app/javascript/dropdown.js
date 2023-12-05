$(function(){
  let btn = $(".dropdown .btn");
  let submenu = $(".dropdown .more_list");
  // クリックイベント
  $(btn).click(function(event) {
    event.preventDefault();
    if ($(submenu).css("display") == "none") {
      $(submenu).slideDown("fast");
    } else {
      $(submenu).slideUp("fast");
    }
  });

  // ホバーイベント
  $(".dropdown").hover(
    function () {
      // ホバー開始時の処理
    },
    function () {
      $(submenu).slideUp("fast");
    }
  );
});
