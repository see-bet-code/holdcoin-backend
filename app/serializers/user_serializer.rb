class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :username, :password, :balance
  has_many :transactions
  has_many :cryptos, through: :transactions

end
