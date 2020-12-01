class CryptoSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :symbol, :hold_goal, :stop_limit, :max_supply, :group
  has_many :transactions
  has_many :users, through: :transactions
end