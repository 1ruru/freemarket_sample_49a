$(function() {
  function build_MIDHTML(Categories) {
    let html = `<option value="">---</option>`;
    $.each(Categories, function(i, category) {
      html += `<option value="${category.id}" data-ancestry="${
        category.ancestry
      }">${category.name}</option>`;
    });
    return html;
  }

  function build_SMALLHTML(Categories) {
    let html = `<option value="">---</option>`;
    $.each(Categories, function(i, category) {
      html += `<option value="${category.id}">${category.name}</option>`;
    });
    return html;
  }

  //category-select_box
  $("#selectitembox").change(function() {
    let large_id = $(this).val();
    $.ajax({
      url: "/api/items/new",
      type: "get",
      data: {
        select_item_0: large_id
      },
      dataType: "json"
    })
      .done(function(midCategories) {
        console.log(midCategories);
        let midCategories_html = build_MIDHTML(midCategories);
        $("#selectitembox1").empty();
        $("#selectitembox1").append(midCategories_html);
      })
      .fail(function() {
        alert("error.");
      });
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
    let large_id = $("#selectitembox").val();
    let mid_id = $(this).val();
    $.ajax({
      url: "/api/items/new",
      type: "get",
      data: {
        select_item_0: large_id,
        select_item_1: mid_id
      },
      dataType: "json"
    })
      .done(function(smallCategories) {
        console.log(smallCategories);
        let smallCategories_html = build_SMALLHTML(smallCategories);
        $("#selectitembox2").empty();
        $("#selectitembox2").append(smallCategories_html);
      })
      .fail(function() {
        alert("error.");
      });
    if ($(this).val() !== "") {
      $("#selectitembox2").show();
    } else {
      $("#selectitembox2").hide();
      $("#selectitembox2").val("");
    }
  });
  //category-select_boxここまで

  // one_grade = Category.find_by(name: "メンズ")
  // one_grade.children
  // one_grade.indirects
});
