require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../models/tag' )

class TestTag < MiniTest::Test


  def setup
    @tag1 = Tag.new({'type' => 'Groceries'})
  end


  def test_get_name
      assert_equal("Groceries",@tag1.type)
  end


end
