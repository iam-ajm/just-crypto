class HomeController < ApplicationController
  def index
    @url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["btc", "etc", "usdt", "sol", "ada",]
  end

  def about
  end

  def lookup
    @url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coins = JSON.parse(@response)

    @symbol = params[:sym]

    if @symbol
      @symbol = @symbol.downcase
    end

    if @symbol == ""
      @symbol = "Hey! You forgot to enter a currency!"
    end
  end
end