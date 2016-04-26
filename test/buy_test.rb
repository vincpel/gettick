
require 'test_helper'
require 'gettick/gettick'
require 'gettick/quote'

class TestBuy < Minitest::Test

  #def setup

  #end

  def test_default
    assert_equal true, true
  end


  def test_buy
    stub_io_portfolio do 
      account, title = Gettick::buy({},{},["BMO",4])
      assert_equal account, 9740.32
      assert_equal title["bmo"], 8
    end
  end

  def test_buy_with_empty_portfolio
    stub_io_portfolio('{"account" : 10000 , "title":{}}') do 
      account, title = Gettick::buy({},{},["BMO",4])
      assert_equal account, 9740.32
      assert_equal title["bmo"], 4
    end
  end

  def test_buy_would_result_under_zero
    stub_io_portfolio('{"account" : 100 , "title":{}}') do 
      assert_output nil, "aborting ... your account would be under 0 !\n" do 
        Gettick::buy({},{},["BMO",2])
      end
    end
  end

  
end
