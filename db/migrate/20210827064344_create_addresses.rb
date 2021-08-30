class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,    null: false
      t.integer    :prefecture_id,  null: false
      t.string     :municipalities, null: false
      t.string     :building_name
      t.string     :tel,            null: false
      t.string     :street,         null: false
      t.references :purchase,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
