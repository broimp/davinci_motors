require 'rails_helper'

RSpec.describe Car, type: :model do
  it "is invalid without a model" do
    car = Car.new(model: nil)
    car.valid?
    expect(car.errors[:model]).to include("can't be blank")
  end
  it "is invalid without a make" do
    car = Car.new(make: nil)
    car.valid?
    expect(car.errors[:make]).to include("can't be blank")
  end
  it "is invalid without a year" do
    car = Car.new(year: nil)
    car.valid?
    expect(car.errors[:year]).to include("can't be blank")
  end
  it "is invalid without a price" do
    car = Car.new(price: nil)
    car.valid?
    expect(car.errors[:price]).to include("can't be blank")
  end
  it "should validate_numericality_of(:price).is_less_than(1_000_000).is_greater_than(0.00)" do
    car = Car.new(price: 2_000_000)
    car.valid?
    expect(car.errors[:price]).to include("must be less than 1000000")
  end
  it "should validate_inclusion_of(:year).in_range(1965..Time.zone.now.year)" do
    car = Car.new(year: 1960)
    car.valid?
    expect(car.errors[:year]).to include("is not included in the list")
  end
end
