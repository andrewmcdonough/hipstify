jQuery(document).ready(function($) {
  console.log("hello");
  $("#content").html("Testing jQuery");
  $.get("http://spotview.dev/reviews.json", function(data) {
    html = "";
    console.log(data);
    html += "<table width='100%' class='listing'>";
    html += "<tr><th>Artist</th><th>Album</th><th>Blog</th><th>Rating</th>";
    for (row in data) {
      artist_link = data[row]["artist_spotify_uri"];
      recording_link = data[row]["recording_spotify_uri"];
      var rating_color = data[row]["rating_color"];
      html += "<tr>"
      html += "<td><a href='"+artist_link+"'>"+data[row]["artist"]+"</a></td>";
      html += "<td><a href='"+recording_link+"'>"+data[row]["recording"]+"</a></td>";
      html += "<td>"+data[row]["blog_title"]+"</td>";
      html += "<td><span class='rating-"+rating_color+"'>"+data[row]["rating"]+"</span></td>";
      html += "</tr>" 
    }; 
    html += "</table>";
    $("#content").html(html);
  });
});


