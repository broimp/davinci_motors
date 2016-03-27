FactoryGirl.define do
  factory :car do
    make { Faker::Commerce.product_name }
    model { Faker::Commerce.product_name }
    year { rand(1965..2016) }
    price { sprintf("%.02f", rand * 999999) }
  end
end
