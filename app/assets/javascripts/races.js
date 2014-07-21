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
          // icon: "/app/assets/javascripts/marker-pin-google.svg",
        });
      }
    }
  });

//   map.addMarker({
//     lat: latlng.lat(),
//     lng: latlng.lng(),
    // icon: "/images/mapicon.png"
// });

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

json.hotelName 'The Ritz Carlton'
json.hotelAddress 'Postdamer Platz 3, 10785 Berlin, Germany'
json.hotelLat ''
json.hotelLong ''
json.hotelRating '4.3'
json.hotelPrice '£205'
json.hotelGym 'Y'
json.hotelWifi 'Y'
json.hotelBreakfast 'Y'