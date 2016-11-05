class Company < ApplicationRecord
  belongs_to :category
  belongs_to :city
  belongs_to :state
  belongs_to :zip_code
end
