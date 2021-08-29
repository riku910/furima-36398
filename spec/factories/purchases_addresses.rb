FactoryBot.define do
  factory :purchase_address do
    postal_code    {'123-4567'}
    prefecture_id  {2}
    municipalities {'京都市'}
    building_name  {'建物名'}
    street         {'1-1'}
    tel            {'08012345678'}
  end
end