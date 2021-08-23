class CreateShippingPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_prices do |t|

      t.timestamps
    end
  end
end
