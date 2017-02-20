class Finding < ApplicationRecord
  attr_reader :technology_tokens
  attr_accessor :technology_tokens

  has_many :finding_technologies
  has_many :technologies, through: :finding_technologies
  belongs_to :company

  def technology_tokens=(ids)
    self.technology_ids = ids.split(",")
  end

  def tech_list
    self.technologies.map { |tech|  tech.name.capitalize }.join(",")
  end
end
