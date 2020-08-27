FactoryBot.define do
  factory :item_management_address do
    token { 'test' }
    zip_code { '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    lot_number { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    telephone { Faker::Number.between(from: 1, to: 11) }
  end
end
