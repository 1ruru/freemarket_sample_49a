$(function() {
  console.log("aaa");
  $fileField = $(".sell-upload-drop-file");

  $(document).on("change", $fileField, function(evt) {
    var files = evt.target.files;
    var previewarea = document.getElementsByClassName("previewfield");
    var previewareacount = previewarea.length;
    $(".sell-upload-drop-file").hide();
    if (
      files !== null &&
      files !== undefined &&
      previewareacount + files.length <= 10
    ) {
      for (var i = 0, f; (f = files[i]); i++) {
        if (!f.type.match("image.*")) {
          continue;
        }

        var reader = new FileReader();

        reader.onload = (function(theFile) {
          return function(e) {
            var div = document.createElement("div");
            div.className = "previewfield";
            div.innerHTML = [
              '<img class="itempreview" src="',
              e.target.result,
              '" data-file="',
              escape(theFile.name),
              '"/>'
            ].join("");
            div.insertAdjacentHTML(
              "beforeend",
              '<div class="img_view"><div class="img_view__cover"><a  class="img_edit">編集</a></div><a href=""  class="img_del">削除</a></div>'
            );
            var reference = document.querySelector(".sell-upload-drop-box");
            document
              .getElementById("itemnew_img_field")
              .insertBefore(div, reference);
          };
        })(f);

        reader.readAsDataURL(f);
      }

      var counter = document.getElementsByName("images[name][]").length + 1;
      var next_click = `$("#itemnew_file${counter}").click()`;

      $("#itemnew_img_field__method").attr("onClick", next_click);

      var next_input = `<input type="file" multiple="true" name="images[name][]" id="itemnew_file${counter}" class="itemnew_file" style="display:none">`;
      $(".sell__form__image__uproad").append(next_input);

      if (previewareacount + files.length >= 10) {
        $("#itemnew_img_field__method").hide();
      } else if (previewareacount + files.length >= 5) {
        $("#itemnew_img_field__method").height(100);
      } else {
        $("#itemnew_img_field__method").height(200);
      }

      var dataget = $("#itemnew_img_field__method").attr("data-count");
      var next_input_id = Number(dataget) + 1;
      $("#itemnew_img_field__method").attr("data-count", next_input_id);
    }
    // forはここまで

    if (files !== null && files !== undefined) {
      if (previewareacount + files.length > 10) {
        $("#itemimage_uproad_over").show();
      } else {
        $("#itemimage_uproad_over").hide();
      }
    }
  });
});
