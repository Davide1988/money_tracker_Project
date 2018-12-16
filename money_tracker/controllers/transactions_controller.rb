require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag')
require_relative( '../models/merchant')
require_relative( '../models/transaction')
require_relative( '../models/budget')

also_reload( '../models/*' )


get "/transactions" do
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
  params.inspect
  @transactions = Transaction.new(params)
  @transactions.save
  erb(:"transactions/create")
end

get "/transactions/sort_by_amount" do
  @total = 0
  @transactions = Transaction.find_all
  erb(:"transactions/sort_by_amount")
end
