class Company < ApplicationRecord
  belongs_to :category
  belongs_to :city
  belongs_to :state
  belongs_to :zip_code
  has_many :starred_companies
  has_many :users, through: :starred_companies
  has_many :notes

  before_validation :set_status

  enum status: [:pending, :approved, :denied]

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
