# README

This is an API only Rails application that uses Basic Authentication (combination of username and an access token) with Github API's (https://docs.github.com/en/rest/reference/repos) to perform the following tasks:

* List down repositories from a user's account.

* Create a repository.

* Update repository name and description.

* Update repository topics.

* Enable automated security alerts on a repository.

* Delete a repository.

### Version Information

This application was built on a machine running MacOS v11.2.1 and the following version of Ruby and Rails:

* Ruby v2.6.6p146

* Rails v5.2.4.5

### Running the application

1. Install the required gems using `bundle install`.

2. Copy `.env.example` to `.env` and update it with your github account username and access token. Github has deprecated use of password in basic auth therefore an access token needs to be created and used. (https://github.blog/changelog/2019-08-08-password-based-http-basic-authentication-deprecation-and-removal/).

3. Run `rails s` to start the rails server.

### Running the automated test suite

This application uses `RSpec` as the testing framework. It also uses `VCR` to record the interactions with the Github api in the tests which allows us to run the test-suite in a consistent, reliable and repeatable fashion. Just run the command `rspec` in the project root to run the test suite.

### Testing the endpoints using Postman

I have used Postman for testing the api endpoints during development. I have included a file called `postmain_collection.json` in the project root which is a postman collection file that can be imported into Postman for testing the endpoints. Also, i have generated the API documentation using Postman which can be viewed at https://documenter.getpostman.com/view/14790030/TWDfDtEL .
