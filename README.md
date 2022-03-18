# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Testing was performed using RSpec and Capybara.

## Features
  * Admin Access
    * User must enter HTTP auth login/password to access admin functionality
    *  Admin users can list and create new categories
    *  Admins can add new products using the new category
  * User Authentication
    *  Visitors can go to the registration page from any page in order to create an account
    *  Visitors can sign up for a user account with my e-mail, password, first name and last name
    * Visitors can sign in using my e-mail and password
    * Users cannot sign up with an existing e-mail address (uniqueness validation)
    * Passwords are not stored as plain text in the database (leveraging the bcrypt gem).
  * Order Details
    * Order page contains items, their image, name, description, quantities and line item totals
    * Visitors can place an order (i.e. without logging in and therefore without an e-mail address). The original functionality from the inherited code (even though it is not realistic) should therefore not be suppressed.

## Functionality GIF
!["User buying items from store."](https://github.com/jbenson4/jungle/blob/master/docs/jungle-project.gif?raw=true)

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
2. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
3. Remove Gemfile.lock
4. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
