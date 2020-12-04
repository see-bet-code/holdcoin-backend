class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :size, :side, :total_price, :snapshot_price, :symbol, :created_at, :updated_at
  belongs_to :crypto
  belongs_to :user
end