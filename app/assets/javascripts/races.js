$(document).ready(function(){

  var hotels = [
    {
      name: 'The Ritz Carlton',
      address: 'Postdamer Platz 3, 10785 Berlin, Germany',
      lat: 52.51003,
      lng: 13.375434,
      rating: '4.3',
      price: '£205',
      gym: 'Gym ✓',
      wifi: 'Free Wifi ✓',
      breakfast: 'Breakfast not included ✗'
    },
    {
      name: 'The Mandala Hotel',
      address: 'Postdamer Straße 3, 10785 Berlin, Germany',
      lat: 52.5093,
      lng: 13.3737,
      rating: '4.5',
      price: '£133',
      gym: 'Gym ✓',
      wifi: 'Free Wifi ✓',
      breakfast: 'Breakfast included ✓'
    }
  ];

  var map = new GMaps({
    div: '#map',
    lat: 0,
    lng: 0
  });

  var iconOffset = 0.0015

  GMaps.geocode({
    address: 'Straße des 17. Juni 31, Berlin, Germany',
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        map.setCenter(latlng.lat(), latlng.lng());
        map.addMarker({
          lat: 52.51518 - iconOffset,
          lng: 13.35938,
          icon: "/assets/start_line_icon.png"
        });
      }
    }
  });

  map.addMarker({
    lat: 52.51622 - iconOffset,
    lng: 13.37573,
    title: 'Finish Line',
    icon: "/assets/finish_line_icon.png",

    // click: function(e) {
      // alert('You clicked in this marker');
    // }
    infoWindow: {
      content: '<p>Finish Line</p>'
    }
  });

  for (var i = 0; i < hotels.length; i++) {
    console.log('Heyyy');
    var hotel = hotels[i];

    map.addMarker({
      lat: hotel.lat,
      lng: hotel.lng,
      title: 'hotel',
      icon: "/assets/hotel_icon.png",
      infoWindow: {
        content: 
          '<p>'+ hotel.name + '</p><p>' + hotel.address + '</p><p>' + hotel.rating + '</p><p>'+ hotel.price + '</p><p>' + hotel.gym + '</p><p>' + hotel.breakfast + '</p><p>' + hotel.wifi + '</p>'
      }
    });
  }

  window.map = map;


})