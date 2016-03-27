require 'rails_helper'

feature 'Show a single car: ' do
  scenario 'User shows one car' do
    car = FactoryGirl.create(:car)
    visit cars_path

    click_link "show_car_#{car.id}"
    expect(page).to have_content(car.make)
    expect(page).to have_content(car.model)
    expect(page).to have_content(car.year)
    expect(page).to have_content(car.price)
  end
end
