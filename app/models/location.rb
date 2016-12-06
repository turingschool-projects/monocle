class Location < ApplicationRecord
  belongs_to :company
  belongs_to :zip_code
  belongs_to :city
  belongs_to :state
  accepts_nested_attributes_for :city
  accepts_nested_attributes_for :zip_code
  accepts_nested_attributes_for :state

  before_validation :set_status

  enum status: [:pending, :approved, :rejected]

  def approved
    self.status = 1
    self.save
  end

  def rejected
    self.status = 2
    self.save
  end

  def city_state_zip
    "#{city.name}, #{state.name} #{zip_code.zip_code}"
  end

  private
    def set_status
      self.status ||= 0
    end

end
