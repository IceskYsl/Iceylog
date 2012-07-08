
/*
 * https://github.com/JonJagger/cyberdojo/blob/7e3c21c300cf069e031662d014c47ff1f8e61f05/public/javascripts/jquery-caret_pos.js
 * Cobbled together by Jon Jagger
 */

(function($) {
  
  $.fn.caretPos = function(pos) {
    
    function getCaretPos(control) {
      var caretPos = 0;
      // IE Support
      if (document.selection) 
      {
        control.focus();
        var sel = document.selection.createRange();
        sel.moveStart('character', -control.value.length);
        caretPos = sel.text.length;
      } 
      // Firefox support
      else if (control.selectionStart || control.selectionStart === '0')
      {
        caretPos = control.selectionStart;
      }
      return caretPos;     
    }

    function setCaretPos(control, pos) {
      if (control.setSelectionRange) 
      {
        control.focus();
        control.setSelectionRange(pos, pos);
      } 
      else if (control.createTextRange) 
      {
        var range = control.createTextRange();
        range.collapse(true);
        range.move('character', pos);
        range.select();
      } 
      else
        control.focus(); 
    }
    
    var control = this[0];
    if (pos !== undefined)
      setCaretPos(control,pos);
    else
      return getCaretPos(control);    
  };
  
})(jQuery);

















