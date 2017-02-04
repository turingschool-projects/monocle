function initMap() {
  var coordinates = $('#lat-lng').data('coordinates');

  var map = new google.maps.Map(document.getElementById('company-map'), {
      center: new google.maps.LatLng(coordinates[0][0], coordinates[0][1]),
      zoom: 12
    });

  var bounds = new google.maps.LatLngBounds();
  coordinates.forEach(function(coordinate){
    var latLng = new google.maps.LatLng(coordinate[0], coordinate[1]),
        marker = new google.maps.Marker({
      position: latLng,
      map: map
    });
    bounds.extend(latLng);
  });
  map.fitBounds(bounds);
}
