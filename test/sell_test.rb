

require 'test_helper'
require 'gettick/gettick'
require 'gettick/quote'

class TestSell < Minitest::Test

  #def setup

  #end

  def test_default
    assert_equal true, true
  end


  def test_sell
    stub_io_portfolio do 
      account, title = Gettick::sell({},{},["BMO",4])
      assert_equal account, 10259.68
      assert_equal title["bmo"], 0
    end
  end

  def test_buy_would_result_under_zero
    stub_io_portfolio('{"account" : 100 , "title":{"bmo" : 4}}') do 
      assert_output nil, "you try to sell 5 bu you dont have enougth : bmo\n" do 
        Gettick::sell({},{},["bmo",5])
      end
    end
  end
  
end
