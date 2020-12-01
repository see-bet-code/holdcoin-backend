class Transaction < ApplicationRecord
  #Limit ability to buy without enough balance
  belongs_to :crypto
  belongs_to :user

  before_create :check_balance

  def total_price
    self.crypto.price * self.size
  end

  private
  
  def check_balance
    errors.add(:size, 'Total price cannot exceed user\'s balance') if self.total_price > self.crypto.user.balance
  end
end
