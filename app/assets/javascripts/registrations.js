$(function(){
  $('#go_form--phone').on('click', function(e){
    e.preventDefault();
    $('#form--user-info').fadeOut("fast");
    $('#form--phone').fadeIn("fast");
  });
});