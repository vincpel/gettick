class Quote
  attr_reader :quote
  def initialize(json)
    @quote = json
  end

  def exchange
    @quote["quote"]["StockExchange"]
  end

  def sym
    @quote["quote"]["symbol"]
  end

  def price
    @quote["quote"]["Ask"]
  end

  def exist?
     #puts !(quotejson["quote"]["Ask"].nil?)
     !(@quote["quote"]["Ask"].nil?)
     #!(quotejson["quote"]["symbol"]) && !(quotejson["quote"]["Ask"] == "")
  end

  def attribs
    @quote["quote"]
  end
end
