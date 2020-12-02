class CreateCryptos < ActiveRecord::Migration[6.0]
  def change
    create_table :cryptos do |t|
      t.float :price
      t.string :group
      t.integer :hold_price
      t.integer :stop_limit
      t.string :name
      t.bigint :max_supply
      t.string :symbol

      t.timestamps
    end
  end
end
