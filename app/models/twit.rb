class Twit < ActiveRecord::Base
  # Remember to create a migration!
  validates_length_of :message, maximum: 140
  validates_length_of :message, minimum: 1

  validates :user_id, presence: true
end
