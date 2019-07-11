// カテゴリー(DB)フォーム
// optionは仮置き
$(function () {
  function buildHTML(count) {
    var html = `<div class="select__box">
                  <select class="select__box__format" name="post[${count}_category_id]" id="post_${count}_category_id">
                    <option>---</option>
                    <option value="1">トップス</option>
                    <option value="2">ジャケット/アウター</option>
                    <option value="3">パンツ</option>
                    <option value="4">スカート</option>
                    <option value="5">ワンピース</option>
                    <option value="6">靴</option>
                    <option value="7">ルームウェア/パジャマ</option>
                    <option value="8">レッグウェア</option>
                    <option value="9">帽子</option>
                    <option value="10">バッグ</option>
                    <option value="11">アクセサリー</option>
                    <option value="12">ヘアアクセサリー</option>
                    <option value="13">小物</option>
                    <option value="14">時計</option>
                  </select>
                  <div class="drop-down-icon">
                    <i class="fas fa-chevron-down"></i>
                  </div>
                </div>`
    return html
  }
  $(document).one("change", "#post_first_category_id", function () {
    html = buildHTML("second")
    $('#category-contents').append(html);
  });
  $(document).one("change", "#post_second_category_id", function () {
    html = buildHTML("third")
    $('#category-contents').append(html);
  });
});