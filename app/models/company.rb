class Company < ApplicationRecord
  has_many :company_industries
  has_many :industries, through: :company_industries
  has_many :starred_companies
  has_many :users, through: :starred_companies
  has_many :notes
  has_many :locations

  def self.approved_locations
    Company.joins(:locations).where('locations.status = ?', '1')
  end

  def self.pending_locations
    Company.joins(:locations).where('locations.status = ?', '0')
  end

  def approved?
    self.locations.any? { |location| location.approved? }
  end
end
