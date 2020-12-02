class Api::V1::CryptosController < ApplicationController
  # API_URL = "https://api.pro.coinbase.com"

  # def index
    # response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection&access_token=YOURTOKENHERE=#{search_term}&page=1&per_page=100"
    # json = JSON.parse response
    # if !json['total'].zero?
    #     # @object1link = json["objects"][0]["images"][0]["b"]["url"]
    #     # @object1title = json["objects"][0]["title"]
    #       @objects = json["objects"]
    # else
    #       render :new
    # end
  # end

  def show
    crypto = Crypto.find(params[:id])
    render json: crypto
  end

  def index
      cryptos = Crypto.all
      render json: cryptos
  end

  private

  def crypto_params
      params.permit(
        :name,
        :price,
        :symbol,
        :hold_price,
        :stop_limit,
        :max_supply,
        :group
      )
  end
end