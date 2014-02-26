# Problem Statement #
Task is to create the simplest app (just posts), where you can:  
1) Select which posts to promote to the top  
2) When you select a post to promote, you should also specify how many clicks it should get while promoted (e.g. if it can get 100 clicks, then after users click on it 100 times it shouldn't be promoted anymore)

- - -

# Assumptions and Implementation #

- User should be logged-in to create posts for promotions
- User can create post by adding title and content along number of clicks to should get while promote.
- If number of clicks reached to allowed clicks then clicks will not update. So that post will not promote any more
- There will be a separate view on which all posts of all users will show as promotions.
- User don't need to login to view that promotion list
- User can view any promotion and that promotion will view in separate tab and its click count will be incremented. 
- Post view and promotion view are two separate pages.
- Promotions page auto refresh after every 15 seconds to reorder promotions. 

- - -

## Setup ##
- `bundle install`
- `rake db:create`
- `rake db:migrate`
- `rails s` to start server
- Root URL *localhost:3000/*
- Promotions URL *localhost:3000/promotions*
- To run test cases: `bundle exec rspec `

- - -

## Description ##

This project is based on ruby 2.0 and following gems are used:

- *pg*
- *rails 4.0.2*
- *factory_girl_rails* for dummy data.
- *rspec-rails* for TDD.
- *therubyracer*
- *less-rails*
- *twitter-bootstrap-rails* for styling

- - -


## Suggestion ##
I implemented this application into simpler way. But:
- I can mange promotion click increment using redis database which will be fast as compare to db calls. 
- Capybara can be used to test application navigation but I wrote detailed test cases of controller for better converage. 

