angular.module("strides",['ui.bootstrap']);

function CarouselCtrl($scope) {
  $scope.carouselInterval = 6000;
  
  // var slides = $scope.slides = [
  //   {
  //     image: '/images/paris_bg.jpg',
  //     text: 'Paris',
  //     caption: 'Paris, France'
  //   }, 
  //   {
  //     image: '/images/london_bg.jpg',
  //     text: 'London',
  //     caption: 'London, UK'
  //   },
  //   // {
  //   //   image: '/images/city.jpg',
  //   //   text: 'City',
  //   //   caption: 'Paris, France'
  //   // },
  //   {
  //     image: '/images/berlin_bg.jpg',
  //     text: 'Berlin',
  //     caption: 'Berlin, Germany'
  //   },
  //   {
  //     image: '/images/sydney_bg.jpg',
  //     text: 'Sydney',
  //     caption: 'Sydney, Australia'
  //   }
  // ];

};

$(document).ready(function(){
  // datepicker rails
  $('.input-daterange').datepicker({
    todayHighlight: true,
    // format: "dd M yy",
    startDate: 'today'
  });

  // extract to database?
  var marathonStartDates = {
    'Berlin': '2014-09-28',
    'London': '2015-04-26',
    'Paris': '2015-04-12',
    'Stockholm': '2015-05-30',
    'Sydney': '2014-09-21'
  };

  $('#marathon').on('change', function(){
    var raceSelection = $('#marathon option:selected').text();
    var startDate = new Date(marathonStartDates[raceSelection]); // creates Date object from string
    var arrivalDateObject = (new Date(startDate - 1000*60*60*24)); // default is one day prior to marathon start date
    var arrivalDate = arrivalDateObject.getDate();
    var arrivalMonth = arrivalDateObject.getMonth() + 1; // .getMonth() method starts from Jan = 0
    var arrivalYear = arrivalDateObject.getFullYear();
    var arrivalString = arrivalMonth + '/' + arrivalDate + '/' + arrivalYear;
    // This code also works: var arrivalDate = new Date(startDate.setDate(startDate.getDate()-1));
    $('.input-daterange').datepicker().children('input.arrival').val(arrivalString); // amend value of arrival date automatically
    
    // $('.input-daterange').attr('data-date', startDate) - this might be the code used to amend calender?
  });


  // to add £ sign to max budget dropdown menu
  $('.price option').slice(1,4).prepend('£');

});