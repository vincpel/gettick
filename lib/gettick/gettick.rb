module Gettick

  def self.portfoliofile
    ".portfolio"
  end

  def self.lookup(global_options, options, args)
    args.each do |i|
      quote = Quote.new(pullatick i)

      if quote.exist?
        if options[:i]
          lookupi(quote) if options[:i]
        else
          sxc = ""
          sxc = " market is : " + quote.exchange if options[:s]
          puts i + "  is a valid quote" + sxc
        end
      else
        puts i + "  can't be found"
      end
    end
  end

  def self.lookupi(quote)
    puts "----------------------------------------------"
    puts "symbol" " : " + quote.attribs["symbol"]
    puts "----------------------------------------------"
    puts "Ask" " : " + quote.attribs["Ask"]
    puts "Bid" " : " + quote.attribs["Bid"]
    puts "AverageDailyVolume" " : " + quote.attribs["AverageDailyVolume"]
    puts "Currency" " : " + quote.attribs["Currency"]
    puts "BookValue" " : " + quote.attribs["BookValue"]
    
  end

  def self.buy(global_options, options, args)
    title = args[0]
    qt    = args[1].to_i
    quote = Quote.new(pullatick title)

    account, title = loadportfolio 

    if title[quote.sym]
      title[quote.sym] += qt
    else
      title[quote.sym] = qt
    end
    account -= qt.to_i * quote.price.to_f

    if account < 0 
      $stderr.puts("aborting ... your account would be under 0 !")
      return
    end

    saveportfolio(account, title)
    [account, title]
  end

  def self.sell(global_options, options, args)
    
    title = args[0]
    qt    = args[1].to_i
    quote = Quote.new(pullatick title)
    account, title = loadportfolio 
    
    if title[quote.sym]
      title[quote.sym] -= qt
    else
      title[quote.sym] = qt
    end

    
    if title[quote.sym] < 0 
      $stderr.puts("you try to sell #{qt} bu you dont have enougth : #{args[0]}")
      return
    end

    account += qt.to_i * quote.price.to_f
    
    saveportfolio(account, title)
    [account, title]
  end

  def self.loadportfolio(file = portfoliofile)
    portfolio = JSON.parse(File.read('.portfolio'))
    [portfolio["account"], portfolio['title']]
  end
  
  def self.saveportfolio(account, title, file = portfoliofile)
    newportfolio = { "account" => account, "title" => title}
    File.open('.portfolio', 'w') do |fo| 
      fo.puts newportfolio.to_json 
    end
  end

  def self.list(global_options, options, args)
    bar = JSON.parse(File.read('.portfolio'))
    puts bar
    puts bar["title"]["aapl"]
  end

  def self.pull

  end
  def self.pullatick(atick)
    
    uri = "https://query.yahooapis.com/v1/public/yql?"+
              "q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20"+
              "in%20%28%22#{atick}%22%29%0A%09%09&"+
              "env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json"
    uri = URI.parse(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @data = http.get(uri.request_uri)
    
    jtick = JSON.parse(@data.body)
    
    extractQuoteFromJson jtick
  end

  def self.extractQuoteFromJson(jsonquote)
    jsonquote["query"]["results"]
  end

  def self.resetPortfolio
    saveportfolio(10000, {})
  end

end




