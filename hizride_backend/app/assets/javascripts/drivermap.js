var map_options = {
   center: new google.maps.LatLng(44.928729, -93.167033),
   zoom: 16,
   mapTypeId: google.maps.MapTypeId.ROADMAP,
   panControl: false,
   mapTypeControl: false,
   zoomControlOptions: { position: google.maps.ControlPosition.LEFT_CENTER }
};

var map = new google.maps.Map(document.getElementById("map-canvas"), map_options);

var polyOptions = {
  strokeColor: '#5e96d9',
  strokeOpacity: 0.8,
  strokeWeight: 6
}

var poly = new google.maps.Polyline(polyOptions);
poly.setMap(map);

var decodedSets = google.maps.geometry.encoding.decodePath(path);
poly.setPath(decodedSets);

$(document).ready(function () {

  $('#drivermap').html("hello from javascript");
  console.log("DFSDF");

  var map_options = {
     center: new google.maps.LatLng(44.928729, -93.167033),
     zoom: 16,
     mapTypeId: google.maps.MapTypeId.ROADMAP,
     panControl: false,
     mapTypeControl: false,
     zoomControlOptions: { position: google.maps.ControlPosition.LEFT_CENTER }
  };

  var map = new google.maps.Map(document.getElementById("map-canvas"), map_options);

  var polyOptions = {
    strokeColor: '#5e96d9',
    strokeOpacity: 0.8,
    strokeWeight: 6
  }

  var poly = new google.maps.Polyline(polyOptions);
  poly.setMap(map);

  var decodedSets = google.maps.geometry.encoding.decodePath(path);
  poly.setPath(decodedSets);
});
