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

// サイズ(enum)、ブランド(入力)フォーム
// optionは仮置き
$(function () {
  $(document).one("change", "#post_third_category_id", function () {
    var sizeHTML = `<label for="post_product_size">サイズ</label>
                    <span class="require__form">必須</span>
                    <div class="select__box">
                      <select class="select__box__format" name="post[third_product_size]" id="post_product_size">
                        <option>---</option>
                        <option>XXS以下</option>
                        <option>XS(SS)</option>
                        <option>S</option>
                        <option>M</option>
                        <option>L</option>
                        <option>XL(LL)</option>
                        <option>2XL(3L)</option>
                        <option>3XL(4L)</option>
                        <option>4XL(5L)以上</option>
                        <option>FREE SIZE</option>
                      </select>
                      <div class="drop-down-icon">
                        <i class="fas fa-chevron-down"></i>
                      </div>
                    </div>`

    var brandHTML = `<label for="product_brand_name">ブランド</label>
                     <span class="any__form">任意</span>
                     <div class="select__box">
                       <input type="text" name="post[brand_name]" class="select__box__format" placeholder="例)シャネル" id="brand_new"></input>
                     </div>`

    $('#size-content').append(sizeHTML);
    $('#brand-content').append(brandHTML);
  });
});