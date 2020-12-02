class User < ApplicationRecord
  #something weird on dependent destroy
  has_many :transactions, dependent: :destroy
  has_many :cryptos, through: :transactions

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password

  before_create :load_balance


  private
  
  def load_balance
    self.balance = 100 if self.balance.nil?
  end

end
