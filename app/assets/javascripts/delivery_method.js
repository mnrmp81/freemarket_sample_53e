$(function () {
  function buildOptions(input){
    var options = (function() {
      if(input == "included") return `<option value="">---</option>
                                      <option value="undecided">未定</option>
                                      <option value="mercari_deli">らくらくメルカリ便</option>
                                      <option value="yu_mail">ゆうメール</option>
                                      <option value="letter_pack">レターパック</option>
                                      <option value="normal_mail">普通郵便（定形、定形外）</option>
                                      <option value="kuroneko">クロネコヤマト</option>
                                      <option value="yu_pack">ゆうパック</option>
                                      <option value="click_post">クリックポスト</option>
                                      <option value="yu_packet">ゆうパケット</option>`;
                                      
                              return `<option value="">---</option>
                                      <option value="undecided">未定</option>
                                      <option value="kuroneko">クロネコヤマト</option>
                                      <option value="yu_pack">ゆうパック</option>
                                      <option value="yu_mail">ゆうメール</option>`;
    })();
    return options
  }


  function buildHTML(input) {
    var options = buildOptions(input)

    var html = `<div class="form__content__default" id="delivery_method_form">
                  <label for="post_delivery_method">発送方法</label>
                  <span class="require__form">必須</span>
                  <div class="select__box">
                    <select class="select__box__format" name="post[delivery_method]" id="delivery_method_content">
                      ${options}
                    </select>
                    <div class="drop-down-icon">
                      <i class="fas fa-chevron-down"></i>
                    </div>
                  </div>
                </div>`
    return html;
  }

  $(document).on("change", "#post_delivery_fee", function () {
    var input = $(this).val();
    if ($('#delivery_method_form').length == 0) {
      html = buildHTML(input);
      $(html).insertAfter('#delivery_fee_content');
    }
  });

  $(document).on("change", "#post_delivery_fee", function () {
    var input = $(this).val();
    if (input == "") {
      $('#delivery_method_form').remove();
    } else {
      options = buildOptions(input);
      $('#delivery_method_content').empty();
      $('#delivery_method_content').append(options);
    }
  });
});

