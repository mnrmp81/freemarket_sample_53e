$(function () {
  function brandHTML() {
    var html = `<label for="product_brand_name">ブランド</label>
                     <span class="any__form">任意</span>
                     <div class="select__box">
                       <input type="text" name="post[brand_name]" class="select__box__format" placeholder="例)シャネル" id="brand_new"></input>
                     </div>`
    return html
  }

  $(document).on("change", "#post_third_category_id", function () {
    var input = $('#post_first_category_id').val();
    if (input == 5 || input == 10 || input == 11 ) {
      $('#brand-content').empty();
    } else {
      if ($('#brand_new').length == 0) {
        var html = brandHTML();
        $('#brand-content').append(html);
      }
    }
  });
});
