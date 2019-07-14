$(function() {

  function buildHTML(count) {
    var html = `<div class="preview-box" id="preview-box__${count}">
                  <div class="upper-box">
                    <img src="" width="112" height="112" alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="update-box">
                      <label class="edit_btn">編集</label>
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
  $(document).on('change', '.hidden-field', function() {
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      if ($(`#preview-box__${id}`).length == 0) {
        var count = $('.preview-box').length;
        var html = buildHTML(count);
        var prevContent = $('.label-content').prev();
        $(prevContent).append(html);
      }
      $(`#preview-box__${id} img`).attr('src', `${image}`);
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

  // 画像の削除
  $(document).on('click', '.delete-box', function() {
    var count = $('.preview-box').length;
    setLabel(count);
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    if ($(`#post_images_attributes_${id}__destroy`).length == 0) {
      $(`#post_images_attributes_${id}_image`).val("");
      $(`#post_images_attributes_${id}_image`).appendTo('.hidden-content');
    } else {
      $(`#post_images_attributes_${id}__destroy`).prop('checked',true);
    }
    $(`#preview-box__${id}`).remove();
    if (id <= 4) {
      var prevContentFirst = $('.prev-content').first();
      $('#preview-box__5').appendTo(prevContentFirst);
    }
    $('.hidden-field').each(function(index, field){
      $(field).attr({name: `post[images_attributes][${index}][image]`, id: `post_images_attributes_${index}_image`});
    })
    $('.preview-box').each(function(index, box){
      $(box).attr('id', `preview-box__${index}`);
    })
    $('.delete-box').each(function(index, box){
      $(box).attr('id', `delete_btn_${index}`);
    })
    var count = $('.preview-box').length;
    if (count == 4){
      var prevContent = $('.label-content').prev();
      $(prevContent).remove();
    } else if (count == 9) {
      $('.label-content').show();
    }
    setLabel(count);
  });
});