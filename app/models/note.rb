class Note < ApplicationRecord
  belongs_to :user
  has_many :company_notes, dependent: :destroy
  has_many :companies, through: :company_notes

  def self.get_notes(company_id, user)
    if company_id
      Company.find(company_id).notes
    else
      user.notes
    end
  end

end
