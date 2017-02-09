function initCompanyMap() {

  var companyId = $('#company-id').data('companyId');

  var coordinates = getCoordinates();
  debugger;

  var map = new google.maps.Map(document.getElementById('company-map'), {
      center: new google.maps.LatLng(coordinates[0][0], coordinates[0][1]),
      zoom: 12
    });

  var bounds = new google.maps.LatLngBounds();

  coordinates.forEach(function(coordinate){
    if (coordinate !== undefined) {
      var latLng = new google.maps.LatLng(coordinate.lat, coordinate.lng),
          marker = new google.maps.Marker({
        position: latLng,
        map: map
      });
      bounds.extend(latLng);
    }
  });

  map.fitBounds(bounds);
  zoomChangeBoundsListener =
    google.maps.event.addListenerOnce(map, 'bounds_changed', function(event) {
      if (this.getZoom()){
          this.setZoom(9);
      }
    });
}

function getCoordinates() {
  var companyId = $('#company-id').data('companyId');

  var locations = $.parseJSON($.ajax({
    url: `/api/v1/companies/${companyId}/locations`,
    method: "GET",
    data: {'company_id': companyId},
    type: "json",
    async: false
  }).responseText);

  return extractCoordinates(locations);
}

function extractCoordinates(locations) {
  var coordinates = locations.map(function(location){
    if (location.status === "approved") {
      return JSON.parse(location.coordinates)
    }
  })
  return coordinates;
}
