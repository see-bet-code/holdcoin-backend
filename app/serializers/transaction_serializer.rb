class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :size, :side
  belongs_to :crypto
  belongs_to :user
end