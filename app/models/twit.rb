class Twit < ActiveRecord::Base
  # Remember to create a migration!
  validates_length_of :message, maximum: 140
  validates :user_id, presence: true
end
