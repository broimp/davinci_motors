FactoryGirl.define do
  factory :car do
    make { Faker::Commerce.product_name }
    model { Faker::Commerce.product_name }
    year { sprintf("%.00f", rand * 2016) }
    price { sprintf("%.02f", rand * 999) }
  end
end
