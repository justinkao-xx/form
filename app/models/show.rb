class Show < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 300}
  validates :year, presence: true, length: {maximum: 20}, numericality: { only_integer: true, greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today.year }
  validates :seasons, presence: true, length: {maximum: 50}, numericality: { only_integer: true }
end
