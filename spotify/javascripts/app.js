jQuery(document).ready(function($) {
  console.log("hello");
  $("#content").html("Testing jQuery");
  $.get("http://spotview.dev/reviews.json", function(data) {
    html = "";
    console.log(data);
    html += "<ul>";
    for (row in data) {
      html += "<li>"
      html += data[row]["artist"];
      html += "</li>" 
    }; 
    html += "</ul>";
    $("#content").html(html);
  });
});


