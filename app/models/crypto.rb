class Crypto < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions

  before_create :check_stop_limit_prices

  private

  def check_stop_limit_prices
    errors.add(:hold_price, 'Crypto\'s price must exceed hold price') if self.hold_price <= self.price
    errors.add(:stop_limit, 'Stop limit cannot exceed crypto\'s price') if self.stop_limit >= self.price
  end

end
