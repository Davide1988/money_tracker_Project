require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../models/budget' )

class TestBudget < MiniTest::Test


  def setup
    @budget1 = Budget.new({'budget_amount' => 30.55})
  end


  def test_get_name
      assert_equal(30.55, @budget1.budget_amount)
  end


end
