class CryptoSerializer < ActiveModel::Serializer
  attributes :id
  has_many :transactions
end
