angular.module("strides",['ui.bootstrap']);

function CarouselCtrl($scope) {
  $scope.carouselInterval = 6000;
  
  var slides = $scope.slides = [
    {
      image: '/images/paris_bg.jpg',
      text: 'Paris',
      caption: 'Paris, France'
    }, 
    {
      image: '/images/london_bg.jpg',
      text: 'London',
      caption: 'London, UK'
    },
    // {
    //   image: '/images/city.jpg',
    //   text: 'City',
    //   caption: 'Paris, France'
    // },
    {
      image: '/images/berlin_bg.jpg',
      text: 'Berlin',
      caption: 'Berlin, Germany'
    },
    {
      image: '/images/sydney_bg.jpg',
      text: 'Sydney',
      caption: 'Sydney, Australia'
    }
  ];

};

$(document).ready(function(){
  // datepicker rails
  $('.input-daterange').datepicker({
    todayHighlight: true
  });

  // to add £ sign to max budget dropdown menu
  $('.price option').slice(1,4).prepend('£');

});