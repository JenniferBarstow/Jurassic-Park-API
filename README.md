
# README

# Jurassic Park Rails 6 API
##### A Ruby on Rails Open API Search that allows an authenticated user to enter a valid year and get a response of Albums released in that year, pulling from Spotifys Web API
#

###### Ruby version 3.0.2
###### Rails version  6.1.7.3
#

##### Development 
http://localhost:3000/


A Rails 6 API with the following features:
  - JSON formatted RESTful API 
  - Filtering Dinosaurs by species name
  - Filtering Dinosaurs by cage name
  - Data persisted with PostgreSQL
  - Custom validation for making sure Carnivores and herbivore are not in the same cage separation
  - Custom validation for making sure Carnivores are only in a cage with their own Species
  - Setting the diet so that it is in sync with that of it's Species
  - Custom validation tests
  - Model method tests
 
    

### Setup
 - `rake db:create db:migrate db:seed`

Filtering availale for both the `/dinosaurs`

### Filtering Queries
- /Api/V1/dinosaurs{?species=Tyrannosaurus}| dinosaurs#index |  ( Filter all of the dinosaurs by species name)
- /Api/V1/dinosaurs{?cage=Tough Guys}| dinosaurs#index |   ( Filter all of the dinosaurs by cage name)



### Useful Endpoints

| Method | Endpoint | Action  | Description |
| ----- | ------ | ----- | ----------  | 
| GET |  /Api/V1/dinosaurs | dinosaurs#index| view all dinosaurs
| GET |  /Api/V1/dinosaurs/1 | dinosaurs#show| view a dinosaur
| POST |  /Api/V1/dinosaurs | dinosaurs#create| create dinosaur
| PUT |  /Api/V1/dinosaurs/1 | dinosaurs#update| update dinosaur attributes, such as cage
| GET |  /Api/V1/cages | cages#index| view all cages and the dinosaurs contained in them
| GET |  /Api/V1/cages/1 | cages#show| view a cages and the dinosaurs contained in them
| POST |  /Api/V1/cages | cages#create| create cage
| PUT |  /Api/V1/cages/1 | cages#update| update cage attributes
| GET |  /Api/V1/species | species#index| view all species 
| GET |  /Api/V1/species/1 | species#show| view a species
| POST |  /Api/V1/species | species#create| Create new species
| PUT |  /Api/V1/species/1 | species#update| Update a species



#
### Example Responses

##### Example response for: /Api/v1/cages



##### Example response for: /Api/v1/dinosaurs?species=Tyrannosaurus

### Things I would add if more time was permitted
  - Pagination 
  - Caching, using Redis
  - Contained json formatting outside of controllers

  

### Testing

Custom Validation and Model Method Tests included 
```sh
$ rspec/requests/models
```

###  Errors
###### Example Invalid search query response
{
    "error": "Please enter a valid species name"
}
#

