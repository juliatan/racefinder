angular.module("strides",['ui.bootstrap']);

function CarouselCtrl($scope) {
  $scope.carouselInterval = 6000;
  
  var slides = $scope.slides = [
    {
      image: '/images/paris1.jpg',
      text: 'Paris',
      caption: 'Paris, France'
    }, 
    {
      image: '/images/london.jpg',
      text: 'London',
      caption: 'Paris, France'
    },
    // {
    //   image: '/images/city.jpg',
    //   text: 'City',
    //   caption: 'Paris, France'
    // },
    {
      image: '/images/berlin.jpg',
      text: 'Berlin',
      caption: 'Paris, France'
    },
    {
      image: '/images/sydney.jpg',
      text: 'Sydney',
      caption: 'Paris, France'
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