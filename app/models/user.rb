class User < ApplicationRecord
  #something weird on dependent destroy
  has_many :transactions, dependent: :destroy
  has_many :cryptos, through: :transactions

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  has_secure_password

  before_create :load_balance

  def total_spend(crypto)
    user.transactions.where(crypto: crypto).inject(0) { |sum, t| sum + t.total_price }
  end

  def total_size(crypto)
    user.transactions.where(crypto: crypto).inject(0) { |sum, t| sum + t.size }
  end

  def average_price(symbol)
    matched_cryptos = user.cryptos.where(symbol: symbol)
    matched_cryptos.inject(0) { |sum, c| sum + c.price }.to_f / matched_cryptos.size
  end

  private
  
  def load_balance
    self.balance = 100 if self.balance.nil?
  end

end
