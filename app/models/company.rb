class Company < ApplicationRecord
  belongs_to :category
  has_many :starred_companies
  has_many :users, through: :starred_companies
  has_many :notes
  has_many :addresses


end
