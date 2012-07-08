
# PostsController 下所有页面的 JS 功能
window.Posts =
  # 往话题编辑器里面插入图片代码
  appendImageFromUpload : (srcs) ->
    txtBox = $(".post_editor") 
    caret_pos = txtBox.caretPos();
    src_merged = ""
    for src in srcs
      src_merged = "![](#{src})\n"
    source = txtBox.val()
    before_text = source.slice(0, caret_pos)
    txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
    txtBox.caretPos(caret_pos+src_merged.length)
    txtBox.focus()

  # 上传图片
  initUploader : () ->
    $("#post_add_image").bind "click", () ->
      $("#post_upload_images").click()
      return false

    opts =
      url : "/cpanel/photos"
      type : "POST"
      beforeSend : () ->
        $("#post_add_image").hide()
        $("#post_add_image").before("<span class='loading'>上传中...</span>")
      success : (result, status, xhr) ->
        $("#post_add_image").parent().find("span").remove()
        $("#post_add_image").show()

        Posts.appendImageFromUpload([result])

    $("#post_upload_images").fileUpload opts
    return false



  preview: (body) ->
    $("#preview").text "Loading..."
    $.post "/cpanel/posts/preview",
      "body": body,
      (data) ->
        $("#preview").html data.body
      "json"

  hookPreview: (switcher, textarea) ->
    # put div#preview after textarea
    preview_box = $(document.createElement("div")).attr "id", "preview"
    preview_box.addClass("body")
    $(textarea).after preview_box
    preview_box.hide()

    $(".edit a",switcher).click ->
      $(".preview",switcher).removeClass("active")
      $(this).parent().addClass("active")
      $(preview_box).hide()
      $(textarea).show()
      false
    $(".preview a",switcher).click ->
      $(".edit",switcher).removeClass("active")
      $(this).parent().addClass("active")
      $(preview_box).show()
      $(textarea).hide()
      Posts.preview($(textarea).val())
      false

  initCloseWarning: (el, msg) ->
    return false if el.length == 0
    msg = "离开本页面将丢失未保存页面!" if !msg
    $("input[type=submit]").click ->
      $(window).unbind("beforeunload")
    el.change ->
      if el.val().length > 0
        $(window).bind "beforeunload", (e) ->
          if $.browser.msie
            e.returnValue = msg
          else
            return msg
      else
        $(window).unbind("beforeunload")





# pages ready
$(document).ready ->
  $("textarea").bind "keydown","ctrl+return",(el) ->
    if $(el.target).val().trim().length > 0
      $("#reply > form").submit()
    return false

  Posts.initCloseWarning($("textarea.closewarning"))
  $("textarea").autogrow()
  Posts.initUploader()

  Posts.hookPreview($(".editor_toolbar"), $(".post_editor"))

  $("body").bind "keydown", "m", (el) ->
    $('#markdown_help_tip_modal').modal
      keyboard : true
      backdrop : true
      show : true

  # Focus title field in new-post page
  $("body.posts-controller.new-action #post_title").focus()