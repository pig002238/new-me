$(function(){
  // 各投稿ごとのボタンとサブメニューを取得
  let buttons = $(".dropdown .btn");
  let submenus = $(".dropdown .more_list");

  // クリックイベント
  $(buttons).click(function(event) {
    event.preventDefault();
    
    // クリックされた投稿に関連するサブメニューを取得
    let submenu = $(this).siblings(".more_list");

    // 他のサブメニューを非表示にする
    $(submenus).not(submenu).slideUp("fast");

    // クリックされた投稿のサブメニューを表示/非表示切り替え
    if (submenu.css("display") == "none") {
      submenu.slideDown("fast");
    } else {
      submenu.slideUp("fast");
    }
  });

  // ホバーイベント
  $(".dropdown").hover(
    function () {
      // ホバー開始時の処理
    },
    function () {
      // ホバー終了時の処理
      // クリックされていないサブメニューを非表示
      $(submenus).not(":focus").slideUp("fast");
    }
  );
});
