$(document).ready(function(){
  $('#files').tree();
  $('#files a').on('click', function(event){
    event.preventDefault();
  });
})
