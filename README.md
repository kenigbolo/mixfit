# DEVELOPERS GUIDE

## Getting Started

+ Clone the repo:
`git clone git@github.com:kenigbolo/mixfit.git` for SSH
`git clone https://github.com/kenigbolo/mixfit.git` for HTTPS

## Framework/Tools Versions

* Ruby version 2.5.1 and above
* Rails 5.2.0

## Database
* Development Environment
    Uses Postgres
* Test environment
    Uses Postgres

## Database Setup
***Note*** `The steps below are critical to get the database running`

* For database to work, postgres must have been installed

Once you have those that sorted out, you can then run your command line and navigate into the project's folder and then perform the following:

* Run `bundle install` to install all dependencies
* Run `rails db:migrate` or `rake db:migrate`

(*the `rake` command was used for rails version prior rails 5. But it is no logner required*)

## Running The Server

You can run `rails s` or `rails server` and visit the page on the browser by typing `localhost:3000`. (*you can add the flag `-p <port_number>` to specify a different port number, e.i. `rails s -p 8000`*)

## Running The Specs
After all the setting up as mentioned above, you can run the tests. The tests are driven by rspec. You can get them fired up by running the following command from the terminal.

  `rspec spec`

or

  `bundle exec rspec`

## Authentication

This demo project comes without any authentication whatsoever however if you wish to implement authentication then hooking it up to json web token will simply fix that seamlessly

## API Main Features
* Create and Update User
* Create and Update Activity Levels
* Create and Update Food Intake
* Generate Recipe results

## API Routes

```ruby
Prefix Verb                 URI    Pattern                                               Controller#Action
root                        GET    /                                                     home#index
api_v1_user_food_intakes    POST   /api/v1/users/:user_id/food_intakes(.:format)         api/v1/food_intakes#create
api_v1_user_food_intake     PATCH  /api/v1/users/:user_id/food_intakes/:id(.:format)     api/v1/food_intakes#update
                            PUT    /api/v1/users/:user_id/food_intakes/:id(.:format)     api/v1/food_intakes#update
api_v1_user_activity_levels POST   /api/v1/users/:user_id/activity_levels(.:format)      api/v1/activity_levels#create
api_v1_user_activity_level  PATCH  /api/v1/users/:user_id/activity_levels/:id(.:format)  api/v1/activity_levels#update
                            PUT    /api/v1/users/:user_id/activity_levels/:id(.:format)  api/v1/activity_levels#update
api_v1_user_recipes         GET    /api/v1/users/:user_id/recipes(.:format)              api/v1/recipes#index
new_api_v1_user_recipe      GET    /api/v1/users/:user_id/recipes/new(.:format)          api/v1/recipes#new
api_v1_user_recipe          GET    /api/v1/users/:user_id/recipes/:id(.:format)          api/v1/recipes#show
api_v1_users                POST   /api/v1/users(.:format)                               api/v1/users#create
api_v1_user                 PATCH  /api/v1/users/:id(.:format)                           api/v1/users#update
                            PUT    /api/v1/users/:id(.:format)                           api/v1/users#update
```

## API Request 

For Full details of all request body composition kindly see the Postman Collection below.

***Note***

#### API Endpoints (User) - /api/v1/users...

* `username` is validated on it's uniqueness

A post request with the body structure below
```ruby
  { "user": {"username": "test-user", "weight": 80, "height": 1.73 } }
```
when sent to the endpoint `/api/v1/users(.:format)` will automatically first search for an existing user with the the username `test-user`. If it finds a database record then it returns the `user` object. If it fails to find a `user` record persisted in the database then it creates a new record and returns the new `user` object as well as attaching the calculated BMI in the returend response. To update a user record `weight` and `height`, the `put` or `patch` request to the update user endpoint must still conform to the body structure above.

The parameters `weight` and `height` permit only numbers i.e. integers and decimals. `Weight` expects value in `Kilograms` while `Height` expects it's values in `Meters`. These values are expected in those units in order to accurately calculate your `Body Mass Index` returned as `bmi`


#### API Endpoints (Activity Level) - /api/v1/:user_id/activity_levels...

Before performing any action i.e. `create` or `update`, a user check is peformed to see if there is an existing user with the id passed in request params `:user_id`. If no user is found you get an error message.

* request required fields `vitamin_c`, `vitamin_d3`, `iron`

The basic request structure conforms to the structure below
```ruby
  { "activity_level": {"vitamin_c": 1, "vitamin_d3": 2, "iron": 3} }
```

The values of `vitamin_c`, `vitamin_d3`, and `iron` must always be a positive integer between the range `1..3`

#### API Endpoints (Food Intake) - /api/v1/:user_id/food_intakes...

Before performing any action i.e. `create` or `update`, a user check is peformed to see if there is an existing user with the id passed in request params `:user_id`. If no user is found you get an error message.

* request required fields `vitamin_c`, `vitamin_d3`, `iron`

The basic request structure conforms to the structure below
```ruby
  { "activity_level": {"vitamin_c": 5, "vitamin_d3": 6, "iron": 7} }
```

The values of `vitamin_c`, `vitamin_d3`, and `iron` must always be a positive integer between the range `4..10`

#### API Endpoints (Recipes) - /api/v1/:user_id/recipes...

Before performing any action i.e. `create` or `update`, a user check is peformed to see if there is an existing user with the id passed in request params `:user_id`. If no user is found you get an error message.

This endpoint performs only `GET` request to retrieve the following data

* All recipes of a user - `/api/v1/users/:user_id/recipes(.:format)`

* Users most recent recipe (using the last activity level and food intake) - `/api/v1/users/:user_id/recipes/new`

* Specific Recipe using recipe id - `/api/v1/users/:user_id/recipes/:id`


## Postman Collection

***The below postman collection has all available endpoints for the api***

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/9e5a71a8f3ade06c7b8c)

***Important to note in postman***
```bash
Set Content-Type to `application/json`
```