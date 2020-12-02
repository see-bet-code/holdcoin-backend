class Crypto < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions

  before_create :check_stop_limit_prices

  # def user_average_price(user)
    #took however much it was and the weight of the current value
  # end

  def average_price
    #took however much it was and the weight of the current value
  end

  private

  def check_stop_limit_prices
    errors.add(:hold_price, 'Crypto\'s price must exceed hold price') if self.hold_price <= self.price
    errors.add(:stop_limit, 'Stop limit cannot exceed crypto\'s price') if self.stop_limit >= self.price
  end
end
