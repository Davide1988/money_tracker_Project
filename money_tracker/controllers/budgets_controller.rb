require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/budget')
also_reload( '../models/*' )

get "/budgets" do
  @budgets = Budget.find_all
  erb(:"budgets/index")
end

get "/budgets/:id/edit" do
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

post "/budgets/:id" do
  @budget = Budget.new(params)
  @budget.update
  redirect to ("/budgets")
end
