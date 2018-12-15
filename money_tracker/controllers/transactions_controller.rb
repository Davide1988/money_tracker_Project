require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag')
require_relative( '../models/merchant')
require_relative( '../models/transaction')
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

post "trasacions" do
  @transactions = Transacion.new(params)
  @transactions.save
  erb(:"transactions/create")
end
