class Note < ApplicationRecord
  belongs_to :user
  belongs_to :company

  enum status: [:for_user, :for_public]
end
