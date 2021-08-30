class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :building_name, :tel, :street, :purchase_id, :token

  with_options presence: true do
    validates  :user_id, :item_id, :municipalities, :street, :token
    validates  :tel, numericality: true, format: { with: /\A\d{10,11}\z/ }
    validates  :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates  :prefecture_id, numericality: { other_than: 1 } 
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, building_name: building_name, tel: tel, street: street, purchase_id: purchase.id)
  end
end