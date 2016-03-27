class Car < ActiveRecord::Base
  validates :make, :model, :year, :price, presence: true
  validates :price, numericality: { greater_than: 0.0, less_than: 1_000_000 }
  validates :year, inclusion: 1965..Time.zone.now.year
end
