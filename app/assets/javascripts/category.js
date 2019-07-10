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

$(function () {
  $(document).one("change", "#post_third_category_id", function () {
    var sizeHTML = `<label for="post_product_size">サイズ</label>
                    <span class="require__form">必須</span>
                    <div class="select__box">
                      <select class="select__box__format" name="post[product_size]" id="post_product_size">
                        <option>---</option>
                        <option value="xxs_or_less">XXS以下</option>
                        <option value="xs">XS(SS)</option>
                        <option value="small">S</option>
                        <option value="middle">M</option>
                        <option value="large">L</option>
                        <option value="xl">XL(LL)</option>
                        <option value="xxl">2XL(3L)</option>
                        <option value="xxxl">3XL(4L)</option>
                        <option value="xxxxl_or_more">4XL(5L)以上</option>
                        <option value="free">FREE SIZE</option>
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