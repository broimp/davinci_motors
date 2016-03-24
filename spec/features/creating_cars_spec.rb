require 'rails_helper'

feature 'Creating Cars: ' do
  scenario 'create one car and price shows on index' do
    car = FactoryGirl.create(:car)
    visit '/'
    expect(page).to have_content(car.model)
  end

  scenario 'create two cars and prices show on index' do
    car = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    visit '/'
    expect(page).to have_content(car.model)
    expect(page).to have_content(car2.model)
  end
end

feature 'Updating Cars: ' do
  scenario 'User deletes a car' do
    car = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    visit cars_path

    click_link "destroy_car_#{car2.id}"

    expect(page).to have_content(car.make)
    expect(page).to have_content(car.model)
    expect(page).to have_content(car.year)
    expect(page).to have_content(car.price)

    expect(page).to_not have_content(car2.make)
    expect(page).to_not have_content(car2.model)
    expect(page).to_not have_content(car2.year)
    expect(page).to_not have_content(car2.price)
  end

  scenario 'User edits a car' do
    car = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    visit cars_path
    click_link "edit_car_#{car2.id}"
    expect(page).to have_field('Model', with: car2.model)
  end
end

feature 'Show a single car: ' do
  scenario 'User shows one car' do
    car = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    visit cars_path

    click_link "show_car_#{car2.id}"
#    save_and_open_page
    expect(page).to have_content(car2.model)
  end
end
