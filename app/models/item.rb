class Item < ApplicationRecord
  validates :title,             presence: true
  validates :detail,            presence: true
  validates :price,             presence: true
  validates :price,             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :shipping_price_id, presence: true
  validates :prefecture_id,     presence: true
  validates :shipping_day_id,   presence: true
  validates :image,             presence: true

  belongs_to :user
  #has_one :purchase
  has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_price
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :category_id,       numericality: { other_than: 1 } 
  validates :status_id,         numericality: { other_than: 1 } 
  validates :shipping_price_id, numericality: { other_than: 1 } 
  validates :prefecture_id,     numericality: { other_than: 1 } 
  validates :shipping_day_id,   numericality: { other_than: 1 } 
end