class Transaction < ApplicationRecord
  #Limit ability to buy without enough balance
  belongs_to :crypto
  belongs_to :user

  before_create :check_balance

  validates_inclusion_of :side, :in => %w( buy sell )

  def total_price
    self.crypto.price * self.size
  end

  private
  
  def check_balance
    new_balance = self.user.balance - self.total_price
    p self.user.balance
    p total_price
    p new_balance
    if new_balance < 0
      errors.add(:size, 'Total price cannot exceed user\'s balance') if self.total_price > self.user.balance
    else
      self.user.update(balance: new_balance)
    end
  end
end
