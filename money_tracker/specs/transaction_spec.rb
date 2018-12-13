require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../models/transaction' )

class TestTransaction < MiniTest::Test


  def setup
    @transaction1 = Transaction.new ({'transaction_date' => '11122018', 'amount' => 30, 'merchant_id' => 1, 'transaction_id' => 2})

  end


  def test_get_name
      assert_equal(11122018,@transaction1.transaction_date)
  end

  def test_get_name
      assert_equal(30,@transaction1.amount)
  end

  def test_get_name
      assert_equal(1,@transaction1.merchant_id)
  end


end
