// カテゴリー(DB)フォーム
// optionは仮置き
$(function () {
  function buildHTML(count) {
    var html = `<div class="select__box">
                  <select class="select__box__format" name="post[${count}_category_id]" id="post_${count}_category_id">
                    <option>---</option>
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
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