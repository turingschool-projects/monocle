class User < ApplicationRecord
  validates_presence_of :username,
                        :slack_uid,
                        :slack_access_token
  validates_uniqueness_of :slack_uid
end
