//= require codemirror
//= require codemirror/modes/ruby
//= require codemirror/modes/javascript

$(document).ready(function(){
  $('#code').each(function(){
    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
      lineNumbers: true,
      mode: 'ruby',
      theme: 'cobalt'
    });
  });
});
