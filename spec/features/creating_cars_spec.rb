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
