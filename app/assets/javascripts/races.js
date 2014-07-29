$(document).ready(function(){

  if($('#map').length > 0) { // only run this JS code if there is a map on the page

    $.get('/races.json?marathon=' + $('#map').data('marathon'), function(marathon){

      $.get('/hotels.json?arrival=' + $('#map').data('arrival') + '&departure=' + $('#map').data('departure') + '&preferred_location=' + $('#map').data('preferred-location') + '&marathon=' + $('#map').data('marathon')+ '&price=' + $('#map').data('price'), function(hotels){

        var map = new GMaps({
          div: '#map',
          lat: 0,
          lng: 0,
          zoom: 14,
          styles: [{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#e0efef"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"hue":"#1900ff"},{"color":"#c0e8e8"}]},{"featureType":"landscape.man_made","elementType":"geometry.fill"},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"water","stylers":[{"color":"#7dcdcd"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"visibility":"on"},{"lightness":700}]}]
        });

        // Shows and hides a marathon route
          $.get('/routes.json', function(races) {
            var raceName = $('#map').data('marathon')

            var marathonRoute = map.drawPolyline({
              path: races[raceName],
              strokeColor: '#2A80B9',
              strokeOpacity: 0.6,
              strokeWeight: 6
            });

            $('.route-checkbox').click(function(){
              if ($('.route-checkbox').is(':checked')) {
                marathonRoute.setVisible(true)
              } else {
                marathonRoute.setVisible(false)
              }
            })

          });
        
        // if ($('.route-checkbox').is(':checked')) {
        //   console.log('checked')
        // };
        
        

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

        // Map controls menu
        $('.map-controls').hide();
        $('.map-menu').mouseenter(function() {
          $(this).find('.map-controls').slideToggle(300)

          // prevents text being selected on double click
          document.ondblclick = function(evt) {
            if (window.getSelection)
                window.getSelection().removeAllRanges();
            else if (document.selection)
                document.selection.empty();
          }
        });

        $('.map-menu').mouseleave(function() {
          $(this).find('.map-controls').slideToggle(300)
        });

        $('.map-menu .fa-plus-square').click(function(){
          map.zoomIn()
        });

        $('.map-menu .fa-minus-square').click(function(){
          map.zoomOut()
        });

        // to ensure start and finish icons are positioned properly due to their shadows
        var iconOffset = 0.0015;

        // Start line marker
        map.addMarker({
          lat: marathon.startLat - iconOffset,
          lng: marathon.startLong,
          icon: "/start_line_icon.png",
          infoWindow: {
            content: 'Start line'
          }
        });

        // Link to start line marker
        $('.start').click(function() {
          map.setCenter(marathon.startLat, marathon.startLong)
        })

        // Link to finish line marker
        $('.finish').click(function() {
          map.setCenter(marathon.finishLat, marathon.finishLong)
        })

        // Finish line marker
        map.addMarker({
          lat: marathon.finishLat - iconOffset,
          lng: marathon.finishLong,
          title: 'Finish Line',
          icon: "/finish_line_icon.png",
          infoWindow: {
            content: 'Finish line'
          }
        });

        // Hotel markers
        hotels.forEach(function(hotel){

          // renders mustache template for hotel popup
          function getHotel(marker) {
            var hotelProfile = Mustache.render($('.hotel-info').html(), hotel);
            var popup = marker.infoWindow
            popup.setContent(hotelProfile)
          }

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
                animation: google.maps.Animation.DROP,
                icon: "/hotel_icon.png",
                // hotel images carousel
                click: function() {
                  var thisMarker = this // the clicked marker for mustache
                  window.setTimeout(function(){  
                    getHotel(thisMarker)             
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
                  maxWidth: 420,
                  content: 
                    '' // necessary to enable mustache template to be rendered
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
