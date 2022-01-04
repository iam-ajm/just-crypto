class HomeController < ApplicationController
  def index
    @api_key = ENV["MY_API_KEY"]
    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"
    @symbol = self.symbol
    @query = {
        "symbol" => @symbol
    }
    @headers = {
        "X-CMC_PRO_API_KEY" => @api_key,
        "Accepts" => "application/json"
    }
    @request = HTTParty.get(@url, :headers => @headers, :query => @query)
    @response = JSON.parse(@request.body)["data"][@symbol]["quote"]["USD"]["price"]
    @coins = JSON.parse(@response)
  end

  def about
  end
end
