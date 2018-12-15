require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant')
also_reload( '../models/*' )

get "/merchants" do
  @merchants = Merchant.find_all
  erb(:"merchants/index")
end

get "/merchants/new" do
  erb(:"merchants/new")
end

post "/merchants" do
  @merchant = Merchant.new(params)
  @merchant.save
  erb(:"merchants/create")
end

get "/merchants/:id" do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/details")
end

get "/merchants/:id/edit" do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit")
end

post "/merchants/:id" do
  @merchant = Merchant.new(params)
  @merchant.update
  redirect to ("/merchants")
end

post "/merchants/:id/delete" do
  @merchant = Merchant.find(params[:id])
  @merchant.delete
  redirect to ("/merchants")
end
