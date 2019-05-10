imageCount = 0;
$(function() {
  /*-------func imageupnavigator html-------*/
  function buildItemImage(file){
      var reader = new FileReader();
      reader.onload = function(){
        imageCount+=1;
        var img = new Image();
        img.src = reader.result;
        img.width = 114;
        img.height = 116;
        var imageColumn, imageRow, navColumn, navRow;
        if(imageCount > 5){
          imageColumn = parseInt(imageCount%5);
        }else{
          imageColumn = parseInt(imageCount);
        }
        if(imageCount >= 5){
          navColumn = imageCount%5 + 1;
        }else{
          navColumn = imageCount + 1;
        }
        imageRow = parseInt(imageCount/6 + 1);
        navRow = parseInt(imageCount/5 + 1);
        // img.style = "grid-column:" + (column-1) + "/" + (column) + ";";
        // img.style += "grid-row:" + (row) + "/" + (row+1) + ";";

        var html_frame = `
        <div class="image-box" style="grid-column:${imageColumn}/${imageColumn+1}; grid-row:${imageRow}/${imageRow+1};">
        </div>`;

        var html_command = `
        <div class="commands" style="display:flex">
          <div class"commands__edit" style="height:44px; width:57px;
           line-height:48px; text-align:center; border:1px solid #f5f5f5;">編集</div>
          <div class"commands__delete" style="height:44px; width:57px; line-height:48px; text-align:center; border:1px solid #f5f5f5;">削除</div>
        </div>
        `;

        $('.image-input-box').append(html_frame);
        $('.image-input-box .image-box').last().append(img).append(html_command);

        if(imageCount >= 10){$('.fail-photo').hide();}
        $('.fail-photo').css("grid-column",`${navColumn}/6`).css("grid-row",`${navRow}/${navRow+1}`);
      }
      reader.readAsDataURL(file);
  }


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
  // $("#selectitembox1").change(function() {
  //   if ($(this).val() !== "") {
  //     $("#selectitembox2").show();
  //   } else {
  //     $("#selectitembox2").hide();
  //     $("#selectitembox2").val("");
  //   }
  // });
  //category-select_boxここまで

  //active-storage 画像表示
  $('.sell-upload-drop-file').on('change', function(){
    var files = this.files;
    if((files.length + imageCount) > 10){
      alert('10個より多くの画像は投稿できません.');
      return false;
    }
    $.each(files, function (i, file) {
      buildItemImage(file);
    });
  });
  //active-storage 画像表示 end

  $('.commands__delete').on("click", function(e){
    alert('消す');
    this.parent().delete();
  });
});