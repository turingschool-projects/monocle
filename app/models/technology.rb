class Technology < ApplicationRecord
  has_many :finding_technologies
  has_many :findings, through: :finding_technologies
end
