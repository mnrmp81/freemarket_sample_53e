$(function() {

  function buildHTML(count, image) {
    var html = `<div class="preview-box" id="preview-box__${count}">
                  <div class="upper-box">
                    <img src="${image}" width="112" height="112" alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="update-box">
                      <label for="post_images_attributes_${count}_image" class="edit_btn">編集</label>
                    </div>
                    <div class="delete-box" id="delete_btn_${count}">
                      <span>削除</span>
                    </div>
                  </div>
                </div>`
    return html;
  }

  // ラベルのwidth操作
  function setLabel(count) {
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
    $('.label-box').attr({id: `label-box--${count}`,for: `post_images_attributes_${count}_image`});
  }

  // プレビューの追加
  var inputField = `.label-content .hidden-field`
  $(document).on('change', inputField, function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      var count = $('.preview-box').length;
      var html = buildHTML(count, image);
      var prevContent = $('.label-content').prev();
      $(prevContent).append(html);
      $(`#post_images_attributes_${count}_image`).appendTo(prevContent);
      var count = $('.preview-box').length;
      if (count == 10) { $('.label-content').hide();} 
      else {
        if (count == 5){
          $('.prev-content').after(`<div class="prev-content"></div>`);
        }
        setLabel(count);
      }
    }
  });


  // 画像の編集
  $(document).on('change', '.prev-content input', function() {
    var id = $(this).attr("id").replace(/[^0-9]/g, '');
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      $(`#preview-box__${id} img`).attr('src', `${image}`);
    }
  });

  // 画像の削除
  $(document).on('click', '.delete-box', function() {
    var id = $(this).attr("id").replace(/[^0-9]/g, '');
    $(`#preview-box__${id}`).remove();
    var count = $('.preview-box').length;
    $(`#post_images_attributes_${id}_image`).insertAfter('.label-box');
    $(`#post_images_attributes_${id}_image`).val("");
    setLabel(count);
  });

});