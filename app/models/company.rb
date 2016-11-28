class Company < ApplicationRecord
  belongs_to :category
  belongs_to :city
  belongs_to :state
  belongs_to :zip_code
  has_many :starred_companies
  has_many :users, through: :starred_companies
end
