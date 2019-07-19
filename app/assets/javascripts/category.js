$(function () {
  function buildChildren(child) {
    var html = `<option value="${child.id}">${child.name}</option>`
    return html
  }

  function buildHTML(count) {
    var html = `<div class="select__box">
                  <select class="select__box__format" name="post[${count}_category_id]" id="post_${count}_category_id">
                    <option value="">---</option>
                  </select>
                  <div class="drop-down-icon">
                    <i class="fas fa-chevron-down"></i>
                  </div>
                </div>`
    return html
  }

  $(document).on("change", "#post_first_category_id", function () {
    var parentId = $(this).val();
    $.ajax({
      url: '/posts/child_category',
      type: "GET",
      data: { parent_id: parentId },
      dataType: 'json'
    })
    .done(function(children) {
      if ($('#post_second_category_id').length == 0) {
        var html = buildHTML('second');
        $('#category-contents').append(html);
      } else {
        $('#post_second_category_id option:not(:first)').remove();
      }
      children.forEach(function (child) {
        var html = buildChildren(child);
        $('#post_second_category_id').append(html);
      });
    })
    .fail(function() {
      
    });
  });

  $(document).on("change", "#post_second_category_id", function () {
    var parentId = $('#post_first_category_id').val();
    var childId = $(this).val();
    $.ajax({
      url: '/posts/grandchild_category',
      type: "GET",
      data: { parent_id: parentId, child_id: childId },
      dataType: 'json'
    })
    .done(function(grandchildren) {
      if ($('#post_third_category_id').length == 0) {
        var html = buildHTML('third');
        $('#category-contents').append(html);
      } else {
        $('#post_third_category_id option:not(:first)').remove();
      }
      grandchildren.forEach(function (grandchild) {
        var html = buildChildren(grandchild);
        $('#post_third_category_id').append(html);
      });
    })
    .fail(function() {

    });
  });
});