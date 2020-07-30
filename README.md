# ObituaryHub Microservice 

This microservice was created by students at Turing School of Software and Design. It services an application called [ObituaryHub](https://obituary-hub.herokuapp.com/), a Ruby on Rails application where users can find, read, and share obituaries. The function of this microservice is to act as intermediary between the main Rails application and The New York Times API. It receives requests from our application, sends requests to NYT, consumes and formats the API results based on our needs and specifications, and then sends that JSON back to the rails application to easily format and display to users. 

## Team

Though we are a team of 4, this project was completed entirely by [Jack Cullen](https://github.com/jpc20) and [Eric Larson](https://github.com/EricLarson2020).

## Design Strategy 

All our API endpoints (found below) are ReSTful, compliant with the JSON API spec through the use of serializers, and exposed under an api/v1 namespace. Versioning will come in handy as this project continues to expand; when we make changes to the API down the road, we will be able to distinguish those changes using a `v2` namespace.

## Endpoints 

We are hosted on [Heroku](https://obituary-microservice.herokuapp.com/) and using this URL as the root, you can hit the following endpoints. 

Returns obituaries from NYT for people who died of COVID-19. 

  `https://obituary-microservice.herokuapp.com/api/v1/covid`
 
Returns obituaries from NYT which were published between two given dates. 
Takes params of `begining_date` and `ending_date`, formatted as `YYYYMMDD`.

  `https://obituary-microservice.herokuapp.com/api/v1/date`
 
Returns obituaries from NYT of people with first or last name matching the query param. 

  `https://obituary-microservice.herokuapp.com/api/v1/name`
 
Returns most recent obituaries from NYT. 

  `https://obituary-microservice.herokuapp.com/api/v1/recent`
 
Returns obituaries from NYT with the query params name and year. 

  `https://obituary-microservice.herokuapp.com/api/v1/advanced`
  
 Returns obituaries from NYT with the query param year, formatted as `YYYY`. 

  `https://obituary-microservice.herokuapp.com/api/v1/advanced/year`
  
## Tech Stack 

- Sinatra 
- Faraday 

## Read More 

To read more about ObituaryHub and the rest of our team, as well as see The New York Times endpoints we are utilizing, visit the README file for [ObituaryHub](https://github.com/sagemlee/obituary_hub).
