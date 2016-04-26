require 'test_helper'
require 'gettick/gettick'
require 'gettick/quote'

class TestLookup < Minitest::Test

  #def setup

  #end

  def test_default
    assert_equal true, true
  end

  def test_lookup_avec_un_seul_quote
    with_pull_stubbed(true,"bmo") do 
      assert_output "bmo  is a valid quote\n" do
        Gettick::lookup({},{},["bmo"])
      end
    end
  end
  
  def test_lookup_avec_un_seul_quote_pas_valide
    with_pull_stubbed(false,"nop") do 
      assert_output "nop  can't be found\n" do
        Gettick::lookup({},{},["nop"])
      end
    end 
  end

  def test_lookup_info_stock_echange
    with_pull_stubbed(true,"bmo") do 
      assert_output "bmo  is a valid quote market is : NYQ\n" do
        Gettick::lookup({},{"s"=>true, :s=>true},["bmo"])
      end
    end 
  end
  
  def test_lookup_info_stock_echange_but_quote_not_valid
    with_pull_stubbed(false,"nop") do 
      assert_output "nop  can't be found\n" do
        Gettick::lookup({},{"s"=>true, :s=>true},["nop"])
      end
    end 
  end

  def test_lookupi
    mes = <<-EOF
----------------------------------------------
symbol : bmo
----------------------------------------------
Ask : 64.92
Bid : 63.66
AverageDailyVolume : 711629
Currency : USD
BookValue : 45.91
EOF
    with_pull_stubbed(true,"bmo") do 
      q = Quote.new(Gettick::pullatick("bmo"))
      assert_output mes do
        Gettick::lookupi(q)
      end
       
    end 
  end

  def test_lookupi_not_valid
    with_pull_stubbed(false,"nop") do 
      assert_output "nop  can't be found\n" do
        Gettick::lookup({},{"i"=>true, :s=>true},["nop"])
      end
    end 
  end


end
