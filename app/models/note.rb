class Note < ApplicationRecord
  belongs_to :user
  has_many :company_notes
  has_many :companies, through: :company_notes

  def company_name
    company.name
  end

  def self.get_notes(company_id=nil, user=nil)
    if company_id
      Company.find(company_id).notes
    else
      user.notes
    end
  end

end
