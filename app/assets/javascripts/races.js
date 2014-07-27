$(document).ready(function(){

  if($('#map').length > 0) { // only run this JS code if there is a map on the page

    $.get('/races.json?marathon=' + $('#map').data('marathon'), function(marathon){

      $.get('/hotels.json?arrival=' + $('#map').data('arrival') + '&departure=' + $('#map').data('departure') + '&preferred_location=' + $('#map').data('preferred-location') + '&marathon=' + $('#map').data('marathon')+ '&price=' + $('#map').data('price'), function(hotels){

        var map = new GMaps({
          div: '#map',
          lat: 0,
          lng: 0,
          zoom: 14
        });

        function locationPreference() {
          if ($("#map").data('preferred-location') == 'Start line') {
            return [marathon.startLat, marathon.startLong]
          } else {
            return [marathon.finishLat, marathon.finishLong]
          };
        };

        // Centering the map on load based on user preference
        GMaps.geocode({
          lat: locationPreference()[0],
          lng: locationPreference()[1],
          callback: function(results, status) {
            if (status == 'OK') {
              var latlng = results[0].geometry.location;
              map.setCenter(latlng.lat(), latlng.lng());
            }
          }
        });

        // to ensure start and finish icons are positioned properly due to their shadows
        var iconOffset = 0.0015;

        // Start line marker
        map.addMarker({
          lat: marathon.startLat - iconOffset,
          lng: marathon.startLong,
          icon: "/start_line_icon.png"
        });

        // Finish line marker
        map.addMarker({
          lat: marathon.finishLat - iconOffset,
          lng: marathon.finishLong,
          title: 'Finish Line',
          icon: "/finish_line_icon.png"
        });

        // Hotel markers
        hotels.forEach(function(hotel){

          var arrival = $('#map').data('arrival');
          var departure = $('#map').data('departure');
          var arrivalFormatted = new Date(arrival)
          var departureFormatted = new Date(departure)
          var nightsMilliseconds = departureFormatted - arrivalFormatted
          hotel.numberOfNights = nightsMilliseconds/86400000
          hotel.priceFormatted = (Math.round(hotel.price*100)/100).toFixed(2);
          hotel.totalPrice = hotel.price * hotel.numberOfNights;
          hotel.totalPriceFormatted = (Math.round(hotel.totalPrice*100)/100).toFixed(2);

          // determines walking time and distance to start line
          map.getRoutes({
            origin: [hotel.lat, hotel.long], //hotel coordinates
            destination: [locationPreference()[0], locationPreference()[1]], //start line coordinates
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

              // for each hotel adds a marker to the map, filtered by user selection
              map.addMarker({
                lat: hotel.lat,
                lng: hotel.long,
                title: hotel.name,
                icon: "/hotel_icon.png",
                // hotel images carousel
                click: function() {
                  window.setTimeout(function(){                
                    var options = {
                      $ArrowNavigatorOptions: {
                        $Class: $JssorArrowNavigator$,
                        $ChanceToShow: 2
                      }
                    };
                    var jssor_slider1 = new $JssorSlider$('slider1_container', options);
                  }, 50)
                },
                infoWindow: {
                  content: 
                    '<div id="slider1_container"><div id="slides" u="slides"><div><img class="hotel-photo" src="' + hotel.image1 + 
                    '" /></div><div><img class="hotel-photo" src="' + hotel.image2 + 
                    '" /></div><div><img class="hotel-photo" src="' + hotel.image3 + 
                    '" /></div><div><img class="hotel-photo" src="' + hotel.image4 + 
                    '" /></div></div><span u="arrowleft" class="jssora03l" style="width: 55px; height: 55px; top: 75px; left: 8px;"></span><span u="arrowright" class="jssora03r" style="width: 55px; height: 55px; top: 75px; right: 8px"></span></div><p>' + hotel.name + 
                    '</p><p>' + hotel.address + 
                    '</p><p>Rating: ' + hotel.rating + 
                    '</p><p>Price per night: £'+ hotel.priceFormatted + 
                    '</p><p> £' + hotel.totalPriceFormatted + ' for ' + hotel.numberOfNights + 
                    ' nights</p><p>' + hotel.gym + 
                    '</p><p>' + hotel.breakfast + 
                    '</p><p>' + hotel.wifi + 
                    '</p><p>' + hotel.minutes + ' minutes walk from start line (' + hotel.km + ' km)</p>'
                  } //infoWindow
              }); //map.addMarker

            } //callback: function (e)
          }); // map.getRoutes

        }); // hotels.forEach(function(hotel){

        window.map = map; // for testing purposes

      }); //closing get hotels.json
    }); //closing get races.json
    
  } // if($('#map').length > 0) {
}) // $(document).ready(function(){
