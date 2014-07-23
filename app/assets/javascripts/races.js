$(document).ready(function(){

  if($('#map').length > 0) {

    $.get('/hotels.json?nights=' + $('#map').data('nights'), function(json){

      var hotels = json;

      var map = new GMaps({
        div: '#map',
        lat: 0,
        lng: 0
      });

      var iconOffset = 0.0015;

      function locationPreference() {
        if ($("#map").data('preferred-location') == 'Start line') {
          return [52.51518, 13.35938]
        } else {
          return [52.51622, 13.37573]
        };
      };

      GMaps.geocode({
        lat: locationPreference()[0],
        lng: locationPreference()[1],
        callback: function(results, status) {
          if (status == 'OK') {
            var latlng = results[0].geometry.location;
            map.setCenter(latlng.lat(), latlng.lng());
            map.addMarker({
              lat: 52.51518 - iconOffset,
              lng: 13.35938,
              icon: "/start_line_icon.png"
            });
          }
        }
      });

      map.addMarker({
        lat: 52.51622 - iconOffset,
        lng: 13.37573,
        title: 'Finish Line',
        icon: "/finish_line_icon.png"
      });

      hotels.forEach(function(hotel){
        var route = map.getRoutes({
          origin: [hotel.lat, hotel.long], //hotel coordinates
          destination: [52.51518, 13.35938], //start line coordinates
          callback: function (e) {
            var time = 0;
            var distance = 0;
            var legs = e.pop().legs;

            for (var i=0; i<legs.length; i++) {
              time += legs[i].duration.value;
              distance += legs[i].distance.value;
            }

            var minutesH = time/60;
            var minutes = Math.round(minutesH*100)/100;

            var metres = distance/1000;
            var km = Math.round(metres*100)/100;

            hotel.minutes = minutes;
            hotel.km = km;

            hotel.priceFormatted = (Math.round(hotel.price*100)/100).toFixed(2);

            hotel.numberOfNights = $('#map').data('nights');
            hotel.totalPrice = hotel.price * hotel.numberOfNights;
            hotel.totalPriceFormatted = (Math.round(hotel.totalPrice*100)/100).toFixed(2);

            map.addMarker({
              lat: hotel.lat,
              lng: hotel.long,
              title: hotel.name,
              icon: "/hotel_icon.png",
              infoWindow: {
                content: 
                '<p><img class="hotel-photo" src="' + hotel.images[0]["image_url"] + 
                '"></p><p><img class="hotel-photo" src="' + hotel.images[1]["image_url"] + 
                '"></p><p><img class="hotel-photo" src="' + hotel.images[2]["image_url"] + 
                '"></p><p><img class="hotel-photo" src="' + hotel.images[3]["image_url"] + 
                '"></p><p>' + hotel.name + 
                '</p><p>' + hotel.address + 
                '</p><p>Rating: ' + hotel.rating + 
                '</p><p>Price per night: £'+ hotel.priceFormatted + 
                '</p><p> £' + hotel.totalPriceFormatted + ' for ' + hotel.numberOfNights + 
                ' nights</p><p>' + hotel.gym + 
                '</p><p>' + hotel.breakfast + 
                '</p><p>' + hotel.wifi + 
                '</p><p>' + hotel.minutes + ' minutes walk from start line (' + hotel.km + ' km)</p>'
              }
            });
          }
        });
      })

    });
    
    window.map = map;
  }
})