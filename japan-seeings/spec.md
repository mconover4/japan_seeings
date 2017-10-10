# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    Japan Seeings uses Sinatra
- [x] Use ActiveRecord for storing information in a database
    Models and migrate files use ActiveRecord
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
    This app relies on two models class, User and Spot
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
    User has many Spots, Spot belongs to User
- [x] Include user accounts
    Japan Seeings enables sessions and requires them to use the app
- [x] Ensure that users can't modify content created by other users
    Current user must match user's spots to modify them
- [x] Include user input validations
    User requires username, email and password to sign up and to fill the form properly before posting a Spot
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
