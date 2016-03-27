require 'rails_helper'

feature 'Updating Cars: ' do
  scenario 'User deletes a car' do
    car = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    visit cars_path

    click_link "destroy_car_#{car.id}"

    expect(page).to have_content(car2.make)
    expect(page).to have_content(car2.model)
    expect(page).to have_content(car2.year)
    expect(page).to have_content(car2.price)

    expect(page).to_not have_content(car.make)
    expect(page).to_not have_content(car.model)
    expect(page).to_not have_content(car.year)
    expect(page).to_not have_content(car.price)
  end

  scenario 'User edits a car' do
    car = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    visit cars_path

    click_link "edit_car_#{car2.id}"
    fill_in 'Model', with: 'Heap'
    click_button 'Update Car'
#    save_and_open_page
    expect(page).to have_content('Heap')
  end
end
