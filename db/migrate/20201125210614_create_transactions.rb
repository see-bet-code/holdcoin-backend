class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :size
      t.string :side
      t.belongs_to :crypto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
