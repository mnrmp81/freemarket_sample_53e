$(document).on('turbolinks:load', function(){

  var prevContentFirst = $('.prev-content').first();
  var upperPreviews = $(prevContentFirst).children();
  var prevContentSecond = $('.prev-content').last();
  var lowerPreviews = $(prevContentSecond).children();

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

  //投稿編集時
  var prevContent = $('.label-content').prev();
  labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
  $('.label-content').css('width', labelWidth);
  $('.preview-box').each(function(index, box){ //プレビューにidをつける
    $(box).attr('id', `preview-box__${index}`);
  })
  $('.delete-box').each(function(index, box){ //削除ボタンにidをつける
    $(box).attr('id', `delete_btn_${index}`);
  })
  var count = $('.preview-box').length;
  if (count == 10) { 
    $('.label-content').hide(); //プレビューが10あるときはラベルを隠しておく
  }

  // ラベルのwidth操作
  function setLabel() {
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
  }

  // プレビューの追加
  $(document).on('change', '.hidden-field', function() {
    setLabel();
    $('.label-box').attr({id: `label-box--${count}`,for: `post_images_attributes_${count}_image`});
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      if ($(`#preview-box__${id}`).length == 0) { //プレビューが元々なかった場合はhtmlを追加
        var count = $('.preview-box').length;
        var html = buildHTML(count);
        var prevContent = $('.label-content').prev(); //ラベルの直前のプレビュー群に追加
        $(prevContent).append(html);
      }
      $(`#preview-box__${id} img`).attr('src', `${image}`); //イメージを追加
      var count = $('.preview-box').length; 
      if (count == 10) { 
        $('.label-content').hide(); //プレビューが10個あったらラベルを隠す
      } 
      if (count == 5){
        $('.prev-content').after(`<div class="prev-content"></div>`); //プレビューが5個あったら下段を追加
      }
      setLabel();
      $('.label-box').attr({id: `label-box--${count}`,for: `post_images_attributes_${count}_image`});
    }
  });

  // 画像の削除
  $(document).on('click', '.delete-box', function() {
    var count = $('.preview-box').length;
    setLabel(count);
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    $(`#preview-box__${id}`).remove();
    var upperPreviews = $(prevContentFirst).children();
    if (upperPreviews.length < 5) { //上段プレビューが消された場合
      var prevContentSecond = $('.prev-content').last();
      var lowerPreviews = $(prevContentSecond).children();
      var lowerFirstPrev = $(lowerPreviews).first();
      $(lowerFirstPrev).appendTo(prevContentFirst); //下段のプレビューの1つめを上段に移す
    }
    if ($(`#post_images_attributes_${id}__destroy`).length == 0) { 
      $(`#post_images_attributes_${id}_image`).val(""); //フォームの中身を削除
      $(`#post_images_attributes_${id}_image`).appendTo('.hidden-content'); //フォームを一番後ろへ回す
      $('.hidden-field').each(function(index, field){ //フォームのidとname属性を変更
        $(field).attr({name: `post[images_attributes][${index}][image]`, id: `post_images_attributes_${index}_image`});
      })
      $('.preview-box').each(function(index, box){ //プレビューのidを変更
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function(index, box){ //削除ボタンのidを変更
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 4){
        var prevContent = $('.label-content').prev();
        $(prevContent).remove(); //上段端が消されたら、下段のプレビューボックスを削除
      } else if (count == 9) {
        $('.label-content').show(); //10個めが消されたらラベルを表示
      }
      setLabel(count);
    } else { //編集時
      $(`#post_images_attributes_${id}__destroy`).prop('checked',true); //DBから消す
      var html = `<input class="hidden-field after-field" id="" name="" type="file">`;
      $('.after-fields').append(html); //新しいフォームを追加
      $('.hidden-field').each(function(index, field){
        $(field).attr({name: `post[images_attributes][${index}][image]`, id: `post_images_attributes_${index}_image`});
      })
      var topAfterField = $('.after-fields .after-field').first();
      var count = $(topAfterField).attr('id').replace(/[^0-9]/g, '');
      if (count == 4){
        var prevContent = $('.label-content').prev();
        $(prevContent).remove(); //上段端が消されたら、下段のプレビューボックスを削除
      } else if (count == 9) {
        $('.label-content').show(); //10個めが消されたらラベルを表示
      }
      setLabel();
      $('.label-box').attr({id: `label-box--${count}`,for: `post_images_attributes_${count}_image`});
    }
  });
});