class HomeController < ApplicationController
  def index
    @url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
  end

  def about
  end
end
