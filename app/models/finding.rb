class Finding < ApplicationRecord
  attr_accessor :technology_tokens
  has_many :finding_technologies
  has_many :technologies, through: :finding_technologies
  attr_reader :technology_tokens

  def technology_tokens=(ids)
byebug
    self.technology_ids = ids.split(",")
  end
end
