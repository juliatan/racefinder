Strides
=======

Strides is a web app that helps marathon runners find suitable accommodation for
their upcomming race. Runners will be able to choose their marathon, reference point 
(start or finish line), travel dates and maximum budget, whereupon a map displaying
a curated list of hotels within a specific radius of their chosen point will be
presented.

Strides was my final project, done during my final 2 weeks at Makers Academy (a coding bootcamp).
It was created in collaboration with @nyeeles and @mserino .
The aim of the project was to consolidate all of the coding skills we had learnt
over the previous 10 weeks. We additionally gained experience from seeing a project
through from the planning stage, all the way to completion and presentation in front
of an audience of 80 people.

Objectives of this project
--------------------------
- Create a Ruby on Rails project from scratch
- Incorporate Google Maps and Expedia API
- Utilise Javascript, jQuery and other languages where appropriate
- Testing with RSpec, Capybara and Poltergeist
- Effective teamworking and version control with Git and GitHub

Features
--------
- Simple, easy to use user interface
    * User's criteria submitted on landing page
    * User is then presented with a Google map that clearly displays a curated list of hotels
    * More information and options available to user by clicking on each hotel marker
- Marathon route shown (user can toggle on / off)
- User can sign up with an email and enter their mobile phone number
- Chosen itinerary can then be sent to them via email and / or SMS
- Ability to book hotel directly via a 3rd party booking platform

Heroku
------
[Strides](http://strides.herokuapp.com/)

Technologies used
-----------------
- Ruby
- Rails
- Postgresql
- Capybara
- Rspec
- Javascript
- jQuery
- Poltergeist
- Angular JS
- Bootstrap UI
- Google Maps API (via gmaps.js)
- Expedia API
- Heroku
- Devise
- Twilio
- Mustache.js
- Mailcatcher

Potential next steps
--------------------
- Incorporating live hotel prices (data currently saved to a database)
- Incorporating suggested restaurants and flights data via an API
- Adding new cities

How to run the program
----------------------

```sh
git clone https://github.com/juliatan/racefinder
cd racefinder
bin/rails s
```

Visit http://localhost:3000 in your browser.

How to run tests
----------------

```sh
cd racefinder
rspec
```
