class CreateCryptos < ActiveRecord::Migration[6.0]
  def change
    create_table :cryptos do |t|
      t.integer :price
      t.string :group
      t.integer :bought_price
      t.boolean :performing
      t.integer :hold_goal
      t.integer :stop_limit
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
