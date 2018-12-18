require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag')
require_relative( '../models/merchant')
require_relative( '../models/transaction')
require_relative( '../models/budget')
require_relative( '../models/month')
also_reload( '../models/*' )


get "/transactions" do
  @budget = Budget.find_all
  @total = 0
  @transactions = Transaction.find_all
  erb(:"transactions/index")
end

get "/transactions/new" do
  @merchants = Merchant.find_all
  @tags = Tag.find_all
  erb(:"transactions/new")
end

post "/transactions" do
  @transactions = Transaction.new(params)
  @transactions.save
  erb(:"transactions/create")
end

get "/transactions/sort_by_amount" do
  @total = 0
  @transactions = Transaction.find_all
  erb(:"transactions/sort_by_amount")
end

post "/transactions/:id/delete" do
  @transaction = Transaction.find(params[:id])
  @transaction.delete
  redirect to ("/transactions")
end

get "/transactions/sort_by_categories" do
  @transactions = Transaction.find_all
  @tags = Tag.find_all
  erb(:"transactions/sort_by_categories")
end

get "/transactions/calendar" do
  @transactions = Transaction.find_all
  erb(:"transactions/calendar")
end

post "/transactions/found" do
  @ordered_transactions = []
  @transactions = Transaction.find_all
  @month = Month.new(params)
  erb(:"transactions/found")
end
