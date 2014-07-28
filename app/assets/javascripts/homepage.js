// start of Angular carousel code
angular.module("strides",['ui.bootstrap']);

function CarouselCtrl($scope) {
  $scope.carouselInterval = 6000;
  // Note: photos had to be removed from here into the .html page direct to use rails image tags
};

CarouselCtrl.$inject = ['$scope']; // necessary to stop Heroku from minifying $scope variable
// end of Angular carousel code

$(document).ready(function(){
  // datepicker rails
  $('.input-daterange').datepicker({
    todayHighlight: true,
    // format: "dd M yy",
    startDate: 'today',
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
    
    // think about refactoring this
    var arrivalDateObject = new Date(startDate.getTime() - 1000*60*60*24); // default is one day prior to marathon start date
    var arrivalDate = arrivalDateObject.getDate();
    var arrivalMonth = arrivalDateObject.getMonth() + 1; // .getMonth() method starts from Jan = 0
    var arrivalYear = arrivalDateObject.getFullYear();
    var arrivalString = arrivalMonth + '/' + arrivalDate + '/' + arrivalYear;

    var departureDateObject = new Date(startDate.getTime() + 1000*60*60*24); // default is one day after the marathon start date
    var departureDate = departureDateObject.getDate();
    var departureMonth = departureDateObject.getMonth() + 1;
    var departureYear = departureDateObject.getFullYear();
    var departureString = departureMonth + '/' + departureDate + '/' + departureYear;

    // This code also works: var arrivalDate = new Date(startDate.setDate(startDate.getDate()-1));
    $('.input-daterange').datepicker().children('input.arrival').val(arrivalString); // amend value of arrival date automatically

    $('.input-daterange').datepicker().children('input.departure').val(departureString); // amend value of departure date automatically
    
    // $('.input-daterange').attr('data-date', startDate) - this might be the code used to amend calender?
  });


  // to add £ sign to max budget dropdown menu
  $('.price option').slice(1,4).prepend('£');

});