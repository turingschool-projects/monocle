class Address < ApplicationRecord
  belongs_to :company
  has_one :zip_code
  has_one :city
  has_one :state

  before_validation :set_status

  enum status: [:pending, :approved, :rejected]

  def approved
    self.status = 1
    self.save
  end

  def disapproved
    self.status = 2
    self.save
  end

  private
    def set_status
      self.status ||= 0
    end

end
