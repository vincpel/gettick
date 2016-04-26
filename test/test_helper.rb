gem 'minitest', '=5.4.3'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'
require 'gettick'

#class Test::Unit::TestCase
  # Add global extensions to the test case class here
#end
  def with_pull_stubbed(qvalid,quote)
    if qvalid
      Gettick.stub(:pullatick, lookupmsg(quote)) do
          #Gettick::lookup({},{"s"=>true, :s=>true},["bmo"])
          yield
        end
    else 
      Gettick.stub(:pullatick, lookupmsg_not_valid(quote)) do
          #Gettick::lookup({},{"s"=>true, :s=>true},["bmo"])
          yield
        end
    end
  end

  def stub_io_portfolio(portfolio = '{"account" : 10000 , "title":{"uuu":4,"bmo":4,"aapl":4}}')
    portfolio = JSON.parse portfolio
    with_pull_stubbed(true, "bmo") do
      Gettick.stub :loadportfolio, [portfolio["account"], portfolio['title']] do
        Gettick.stub :saveportfolio, nil do 
          yield
        end
      end
    end
  end

  
  def lookupmsg_not_valid(q)
    mes = <<-EOF
    {
        "quote": {
          "symbol": "#{q}",
          "Ask": null,
          "AverageDailyVolume": null,
          "Bid": null,
          "AskRealtime": null,
          "BidRealtime": null,
          "BookValue": null,
          "Change_PercentChange": null,
          "Change": null,
          "Commission": null,
          "Currency": null,
          "ChangeRealtime": null,
          "AfterHoursChangeRealtime": null,
          "DividendShare": null,
          "LastTradeDate": null,
          "TradeDate": null,
          "EarningsShare": null,
          "ErrorIndicationreturnedforsymbolchangedinvalid": null,
          "EPSEstimateCurrentYear": null,
          "EPSEstimateNextYear": null,
          "EPSEstimateNextQuarter": null,
          "DaysLow": null,
          "DaysHigh": null,
          "YearLow": null,
          "YearHigh": null,
          "HoldingsGainPercent": null,
          "AnnualizedGain": null,
          "HoldingsGain": null,
          "HoldingsGainPercentRealtime": null,
          "HoldingsGainRealtime": null,
          "MoreInfo": null,
          "OrderBookRealtime": null,
          "MarketCapitalization": null,
          "MarketCapRealtime": null,
          "EBITDA": null,
          "ChangeFromYearLow": null,
          "PercentChangeFromYearLow": null,
          "LastTradeRealtimeWithTime": null,
          "ChangePercentRealtime": null,
          "ChangeFromYearHigh": null,
          "PercebtChangeFromYearHigh": null,
          "LastTradeWithTime": null,
          "LastTradePriceOnly": null,
          "HighLimit": null,
          "LowLimit": null,
          "DaysRange": null,
          "DaysRangeRealtime": null,
          "FiftydayMovingAverage": null,
          "TwoHundreddayMovingAverage": null,
          "ChangeFromTwoHundreddayMovingAverage": null,
          "PercentChangeFromTwoHundreddayMovingAverage": null,
          "ChangeFromFiftydayMovingAverage": null,
          "PercentChangeFromFiftydayMovingAverage": null,
          "Name": null,
          "Notes": null,
          "Open": null,
          "PreviousClose": null,
          "PricePaid": null,
          "ChangeinPercent": null,
          "PriceSales": null,
          "PriceBook": null,
          "ExDividendDate": null,
          "PERatio": null,
          "DividendPayDate": null,
          "PERatioRealtime": null,
          "PEGRatio": null,
          "PriceEPSEstimateCurrentYear": null,
          "PriceEPSEstimateNextYear": null,
          "Symbol": "bppp",
          "SharesOwned": null,
          "ShortRatio": null,
          "LastTradeTime": null,
          "TickerTrend": null,
          "OneyrTargetPrice": null,
          "Volume": null,
          "HoldingsValue": null,
          "HoldingsValueRealtime": null,
          "YearRange": null,
          "DaysValueChange": null,
          "DaysValueChangeRealtime": null,
          "StockExchange": null,
          "DividendYield": null,
          "PercentChange": null
        }
      }
    EOF
    JSON.parse mes

  end
  def lookupmsg(q)
    mes = <<-EOF
      {"quote": {
        "symbol": "#{q}",
        "Ask": "64.92",
        "AverageDailyVolume": "711629",
        "Bid": "63.66",
        "AskRealtime": null,
        "BidRealtime": null,
        "BookValue": "45.91",
        "Change_PercentChange": "+0.65 - +1.01%",
        "Change": "+0.65",
        "Commission": null,
        "Currency": "USD",
        "ChangeRealtime": null,
        "AfterHoursChangeRealtime": null,
        "DividendShare": "2.45",
        "LastTradeDate": "4/22/2016",
        "TradeDate": null,
        "EarningsShare": "5.15",
        "ErrorIndicationreturnedforsymbolchangedinvalid": null,
        "EPSEstimateCurrentYear": "7.14",
        "EPSEstimateNextYear": "7.50",
        "EPSEstimateNextQuarter": "1.82",
        "DaysLow": "64.29",
        "DaysHigh": "64.96",
        "YearLow": "47.54",
        "YearHigh": "67.01",
        "HoldingsGainPercent": null,
        "AnnualizedGain": null,
        "HoldingsGain": null,
        "HoldingsGainPercentRealtime": null,
        "HoldingsGainRealtime": null,
        "MoreInfo": null,
        "OrderBookRealtime": null,
        "MarketCapitalization": "41.69B",
        "MarketCapRealtime": null,
        "EBITDA": "0.00",
        "ChangeFromYearLow": "17.29",
        "PercentChangeFromYearLow": "+36.37%",
        "LastTradeRealtimeWithTime": null,
        "ChangePercentRealtime": null,
        "ChangeFromYearHigh": "-2.18",
        "PercebtChangeFromYearHigh": "-3.25%",
        "LastTradeWithTime": "8:00pm - <b>64.83</b>",
        "LastTradePriceOnly": "64.83",
        "HighLimit": null,
        "LowLimit": null,
        "DaysRange": "64.29 - 64.96",
        "DaysRangeRealtime": null,
        "FiftydayMovingAverage": "60.58",
        "TwoHundreddayMovingAverage": "56.88",
        "ChangeFromTwoHundreddayMovingAverage": "7.95",
        "PercentChangeFromTwoHundreddayMovingAverage": "+13.98%",
        "ChangeFromFiftydayMovingAverage": "4.25",
        "PercentChangeFromFiftydayMovingAverage": "+7.02%",
        "Name": "Bank Of Montreal Common Stock",
        "Notes": null,
        "Open": "64.63",
        "PreviousClose": "64.18",
        "PricePaid": null,
        "ChangeinPercent": "+1.01%",
        "PriceSales": "2.85",
        "PriceBook": "1.40",
        "ExDividendDate": "1/28/2016",
        "PERatio": "12.58",
        "DividendPayDate": "5/26/2016",
        "PERatioRealtime": null,
        "PEGRatio": "1.15",
        "PriceEPSEstimateCurrentYear": "9.08",
        "PriceEPSEstimateNextYear": "8.64",
        "Symbol": "bmo",
        "SharesOwned": null,
        "ShortRatio": "19.76",
        "LastTradeTime": "8:00pm",
        "TickerTrend": null,
        "OneyrTargetPrice": "61.00",
        "Volume": "430409",
        "HoldingsValue": null,
        "HoldingsValueRealtime": null,
        "YearRange": "47.54 - 67.01",
        "DaysValueChange": null,
        "DaysValueChangeRealtime": null,
        "StockExchange": "NYQ",
        "DividendYield": "3.78",
        "PercentChange": "+1.01%"
      }}
    EOF
    JSON.parse mes
  end
