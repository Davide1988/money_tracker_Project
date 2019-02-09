
I-coins: 

This is a basic spending tracker app.That allows you to add new transaction and sort them by category and merchant.
With I-coins you can also assing a budget to each category and control your spends monitorig the total budget!

This web-app is build with :

Ruby
PostgreSQL
Sinatra

Installing Sinatra is pretty quick and painless as it is installing the PG gem to access the DB

gem install sinatra
gem install pg

Few step to set up the DB
createdb money_tracker
psql -d money_tracker -f db/money_tracker.sql
rb db/seeds.rb


Run the web-server:
ruby Icoin.rb

Now type the following to your browser:
http://localhost:4567

Enjoy!
