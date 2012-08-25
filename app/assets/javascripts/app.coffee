#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require will_paginate
#= require jquery.timeago
#= require jquery.timeago.settings
#= require jquery.hotkeys
#= require jquery.chosen
#= require jquery.autogrow-textarea
#= require jquery.html5-fileupload
#= require jquery-caret_pos
#= require_self

window.App =
  loading : () ->
    console.log "loading..."
    
  # 警告信息显示, to 显示在那个dom前(可以用 css selector)
  alert : (msg,to) ->
    $(to).before("<div data-alert class='alert-message'><a class='close' href='#'>X</a>#{msg}</div>")

  # 成功信息显示, to 显示在那个dom前(可以用 css selector)
  notice : (msg,to) ->
    $(to).before("<div data-alert class='alert-message success'><a class='close' href='#'>X</a>#{msg}</div>")
      
  openUrl : (url) ->
    window.open(url)


 
      

      
$(document).ready ->
 $("abbr.timeago").timeago()
 $(".alert").alert()
 $('.dropdown-toggle').dropdown()

 

  
