$(document).on('turbolinks:load', function() {
$(function () {
  $('.header_bars_1_right_list_item_icon').click(function() {
    // メニュー表示/非表示
    $(this).next('.header_bars_1_right_list_item_list').slideToggle('fast');
  });

  // マウスカーソルの位置（メニュー上/メニュー外）
  $('.header_bars_1_right_list_item_icon,.header_bars_1_right_list_item_list').hover(function(){
    over_flg = true;
  }, function(){
    over_flg = false;
  });
  
  // メニュー領域外をクリックしたらメニューを閉じる
  $('.header_bars_1_right_list_item_icon').click(function() {
    if (over_flg == false) {
      $('.header_bars_1_right_list_item_list').slideUp('fast');
    }
  });
});
});