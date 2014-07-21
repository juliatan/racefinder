$(document).ready(function(){

  var map = new GMaps({
    div: '#map',
    lat: 0,
    lng: 0
  });

  GMaps.geocode({
    address: 'Straße des 17. Juni 31, Berlin, Germany',
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        map.setCenter(latlng.lat(), latlng.lng());
        map.addMarker({
          lat: 52.51518,
          lng: 13.35938,
        });
      }
    }
  });

  map.addMarker({
    lat: 52.51622,
    lng: 13.37573,
    title: 'Finish Line',
    // icon: "marker-pin-google.svg",

    // click: function(e) {
      // alert('You clicked in this marker');
    // }
    infoWindow: {
      content: '<p>Roundabout</p>'
    }
  });


})

// var pos;
// var marker;
// for(var i = 0 ; i < 10 ; i++) {
//   pos = new google.maps.LatLng(Math.floor(Math.random()*100), Math.floor(Math.random()*50));
//   marker = new google.maps.Marker({
//     position: pos, 
//     map: map, 
//     title: 'Title',
//     icon: '/other/gmap/marker.gif'
//   });
//   var storyClick = new Function("event", "alert('Click on marker "+i+" ');");
//   google.maps.event.addListener(marker, 'click', storyClick);
// }