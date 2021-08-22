FactoryBot.define do
  factory :item do
    title             {'商品名'}
    detail            {'商品詳細'}
    price             {'1000'}
    category_id       {'2'}
    status_id         {'2'}
    shipping_price_id {'2'}
    prefecture_id     {'2'}
    shipping_day_id   {'2'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
