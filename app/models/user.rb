class User < ApplicationRecord
  has_many :cryptos, dependent: :destroy
  # has_many :transactions, through: :cryptos, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password

  before_create :load_balance

  private
  
  def load_balance
    self.balance = 100 if self.balance.nil?
  end

end
