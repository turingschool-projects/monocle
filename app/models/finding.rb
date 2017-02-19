class Finding < ApplicationRecord
  has_many :technologies

  attr_accessor :technology_tokens
  attr_reader :technology_tokens

  def technology_tokens=(ids)
    self.technology_ids = ids.split(",")
  end
end
