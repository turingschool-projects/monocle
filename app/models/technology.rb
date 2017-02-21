class Technology < ApplicationRecord
  before_save { self.name = name.downcase }

  has_many :finding_technologies
  has_many :findings, through: :finding_technologies
end
