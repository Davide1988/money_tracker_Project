
#I-coins: 

This is my first web-app!

I-coins allows you to add new transaction and sort them by category and merchant.
With I-coins you can also assign a budget to each category, control your spending and monitor the total budget!

##This web-app is build with:

Ruby
PostgreSQL
Sinatra

##Installing Sinatra is pretty quick and painless as it is installing the PG gem to access the DB

gem install sinatra
gem install pg

##Few steps to set up the DB include:
createdb money_tracker
psql -d money_tracker -f db/money_tracker.sql
rb db/seeds.rb


##Run the web-server:
ruby Icoin.rb

##Now type the following to your browser:
http://localhost:4567

#Enjoy!
