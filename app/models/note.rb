class Note < ApplicationRecord
  attr_accessor :company_tokens
  belongs_to :user
  has_many :company_notes, dependent: :destroy
  has_many :companies, through: :company_notes
  attr_reader :company_tokens

  def self.get_notes(company_id, user)
    if company_id
      Company.find(company_id).notes
    else
      user.notes
    end
  end

  def company_tokens=(ids)
    self.company_ids = ids.split(",")
  end

end
