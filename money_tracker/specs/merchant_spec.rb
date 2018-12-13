require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../models/merchant' )

class TestMerchant < MiniTest::Test


  def setup
    @merchant1 = Merchant.new({'name' => 'Tesco'})
  end


  def test_get_name
      assert_equal("Tesco",@merchant1.name)
  end


end
