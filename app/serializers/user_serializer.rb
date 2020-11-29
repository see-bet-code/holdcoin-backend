class UserSerializer < ActiveModel::Serializer
  attributes :name, :age, :username, :password, :balance
  has_many :cryptos

end
