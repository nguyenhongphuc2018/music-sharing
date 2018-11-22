$(document).ready(function() {

  $("#select_category").change(function(e) {
    e.preventDefault()
    let data = $("#select_category").val()
    $.ajax({
      type: "GET",
      url: "/songs/filter/",
      dataType: "json",
      data: {
        filter_category_id: data
      }
    })
    .done(function(data) {
      $("#list_song").html(data.search_result);
    })
    $("#paginate").hide()
  });

  $("#select_author").change(function(e) {
    e.preventDefault()
    let data = $("#select_author").val()
    $.ajax({
      type: "GET",
      url: "/songs/filter/",
      dataType: "json",
      data: {
        filter_author_id: data
      }
    })
    .done(function(data) {
      $("#list_song").html(data.search_result); 
    })
    $("#paginate").hide()
  })

  $("#select_singer").change(function(e) {
    e.preventDefault()
    let data = $("#select_singer").val()
    $.ajax({
      type: "GET",
      url: "/songs/filter/",
      dataType: "json",
      data: {
        filter_singer_id: data
      }
    })
    .done(function(data) {
      $("#list_song").html(data.search_result);
    })
    $("#paginate").hide()
  })

  $("#clear_selected").click(function() {
    location.reload()
  })

  var count = 0
  $("#sort_name").click(function() {
    if (count === 0) {
      let data = "name_asc"
      $.ajax({
      type: "GET",
      url: "/songs/filter/",
      dataType: "json",
      data: {sort_name: data}
      }).done(function(data) {
        $("#list_song").html(data.search_result);
      })
      count++
    } else {
      count = 0
      location.reload()
    }
  })

  $("#keyword_filter").on("keyup", function() {
    let value = $(this).val().toLowerCase()
    $("#list_song tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    })
  })
  
  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    event.preventDefault();
  });
  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });
});

// see more and compact lyric
function coLyric() {
  var x = document.getElementById("lyric_close");
  if (x.className === "lyric_open") {
    document.getElementById("coLyric").innerHTML = "v See more...";
    x.className = "closesd";
  } else {
    x.className = "lyric_open";
    document.getElementById("coLyric").innerHTML = "^ Compact";
  }
}

//choose song add to album
$(document).ready(function(){
  $("#myInputListSong").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myListSong li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
