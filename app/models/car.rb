class Car < ActiveRecord::Base
  validates :make, :model, :year, :price, presence: true
end
