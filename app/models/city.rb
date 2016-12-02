class City < ApplicationRecord
  has_many :locations
  has_many :companies, through: :locations
end
