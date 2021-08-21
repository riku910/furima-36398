class Item < ApplicationRecord
  validates :title,             presence: true
  validates :detail,            presence: true
  validates :price,             presence: true
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :shipping_price_id, presence: true
  validates :prefecture_id,     presence: true
  validates :shipping_day_id,   presence: true
  validates :user,              presence: true, foreign_key: true

  belongs_to :user
  has_one :purchase
  has_many :comments
end
