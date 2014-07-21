$(document).ready(function(){

  var map = new GMaps({
    div: '#map',
    lat: 0,
    lng: 0
  });

  GMaps.geocode({
    address: 'Buckingham Palace',
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        map.setCenter(latlng.lat(), latlng.lng());
        map.addMarker({
          lat: latlng.lat(),
          lng: latlng.lng(),
        });
      }
    }
  });

  map.addMarker({
    lat: 51.502593,
    lng: -0.152023,
    title: 'Roundabout',
    icon: "./images/marker-pin-google.svg",

    // click: function(e) {
      // alert('You clicked in this marker');
    // }
    infoWindow: {
      content: '<p>Roundabout</p>'
    }
  });


})
