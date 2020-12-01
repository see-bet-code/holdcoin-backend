class Crypto < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions

  def user_average_price(user)
    #took however much it was and the weight of the current value
  end

  def average_price
    #took however much it was and the weight of the current value
  end

end
