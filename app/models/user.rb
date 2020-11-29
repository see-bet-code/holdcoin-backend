class User < ApplicationRecord
  has_many :cryptos, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  # after_initialize :init
end
