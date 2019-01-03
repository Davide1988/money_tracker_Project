require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/budget')
require_relative( '../models/tag')
also_reload( '../models/*' )

get "/budgets" do
  @tot_budgets = Budget.sum_budgets
  erb(:"budgets/index")
end


get "/budgets/show_all" do
  @budgets = Budget.find_all
  erb(:"budgets/show_all")
end

get "/budgets/new" do
  @budgets = Budget.find_all
  @tags = Tag.find_all
  erb(:"budgets/new")
end

post "/budgets" do
  @budgets = Budget.new(params)
  @budgets.save
  erb(:"budgets/create")
end


get "/budgets/:id/edit" do
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

post "/budgets/:id" do
  @budget = Budget.new(params)
  @budget.update
  redirect to ("/transactions")
end
