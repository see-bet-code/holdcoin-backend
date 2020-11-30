class Transaction < ApplicationRecord
  #Limit ability to buy without enough balance
  belongs_to :crypto
  belongs_to :user, through: :crypto
end
