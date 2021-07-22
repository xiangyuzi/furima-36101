FactoryBot.define do
  factory :purchase_address do
    Faker::Config.locale = :ja
    transient do
      address { Gimei.address }
    end

    postal_code     { Faker::Address.postcode.insert(3, '-') }
    prefecture_id   { Faker::Number.between(from:2, to:48) }
    city            { Faker::Address.city }
    house_number    { Faker::Address.street_address }
    building_number { Faker::Address.building_number }
    phone_number    { Faker::Number.number(digits: 11)}
  end
end
