class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :size
      t.string :side
      t.string :symbol
      t.float :snapshot_price
      t.float :total_price
      t.belongs_to :crypto, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
