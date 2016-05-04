class Message < ActiveRecord::Base
  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :body, presence: true
end
