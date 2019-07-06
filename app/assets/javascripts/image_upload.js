$(function() {
  function buildHTML(i) {
    var html = `<div class="preview-box" id="preview-box__${i}">
                  <div class="upper-box">
                    <img src="" width="112" height="112" alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="update-box">
                      <label for="post_images_attributes_${i}_image">編集</label>
                    </div>
                    <div class="delete-box">
                      <span id="delete_image__${i}">削除</span>
                    </div>
                  </div>
                </div>`
    return html;
  }
  
  // プレビュー追加先（上段or下段）
  function buildPrev(i) {
    var prevContent = (
                        i < 5
                      ? '.prev-content'
                      : '.post__drop__box__container .prev-content:eq(1)'
    );
    return prevContent;
  }

  // ラベルボックスのwidth操作
  function buildLabel(i, prevContent) {
    var labelWidth = (
                      i == 4
                      ? '620px'
                      : 620 - $(prevContent).css('width').replace(/[^0-9]/g, '')
    );
    return labelWidth;
  }

  // 下段ボックスを追加（5プレビュー済）
  function topEdge() {
    $('.prev-content').after(`<div class="prev-content"></div>`);
  }

  // ラベルボックスを削除（10プレビュー済）
  function bottomEdge(i) {
    $(`#label-box--${i}`).remove();
  }

  function addPrev(i) {
    var labelBox = `.label-content #post_images_attributes_${i}_image`
    $(document).on("change", labelBox, function() {
      var html = buildHTML(i);
      var prevContent = buildPrev(i);
      $(prevContent).append(html);
      if (i == 9) {
        bottomEdge(i);
      } else {
        var labelWidth = buildLabel(i, prevContent);
        $(`#label-box--${i}`).css('width', labelWidth);
        $(`#label-box--${i}`).attr({
            id: `label-box--${i+1}`,
            for: `post_images_attributes_${i+1}_image`
        });
        if (i == 4) topEdge();
      }
    });
  }

  $(function() {
    for (let i=0; i<10; i++) {
      addPrev(i);
    }
  });
});