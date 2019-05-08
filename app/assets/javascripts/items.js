$(function() {
  //category-select_box
  $("#selectitembox").change(function() {
    if ($(this).val() !== "") {
      $("#selectitembox1").show();
    } else {
      $("#selectitembox1").hide();
      $("#selectitembox2").hide();
      $("#selectitembox1").val("");
      $("#selectitembox2").val("");
    }
  });
  $("#selectitembox1").change(function() {
    if ($(this).val() !== "") {
      $("#selectitembox2").show();
    } else {
      $("#selectitembox2").hide();
      $("#selectitembox2").val("");
    }
  });
  //category-select_boxここまで
});
