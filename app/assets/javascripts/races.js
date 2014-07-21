$(document).ready(function(){

  var hotels = [
    {
      name: 'The Ritz Carlton',
      address: 'Postdamer Platz 3, 10785 Berlin, Germany',
      lat: 52.51003,
      lng: 13.375434,
      rating: '4.3',
      price: '£205',
      gym: 'Y',
      wifi: 'Y',
      breakfast: 'Y'
    },
    {
      name: 'The Mandala Hotel',
      address: 'Postdamer Straße 3, 10785 Berlin, Germany',
      lat: 52.5093,
      lng: 13.3737,
      rating: '4.5',
      price: '£133',
      gym: 'Y',
      wifi: 'Y',
      breakfast: 'Y'
    }
  ];

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

  for (var i = 0; i < hotels.length; i++) {
    console.log('Heyyy');
    var hotel = hotels[i];

    map.addMarker({
      lat: hotel.lat,
      lng: hotel.lng,
      title: 'hotel'
    });
  }
})