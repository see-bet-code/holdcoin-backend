class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :size, :side, :total_price, :snapshot_price, :symbol
  belongs_to :crypto
  belongs_to :user
end