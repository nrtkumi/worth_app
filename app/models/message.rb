class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :project_id, presence: true
  validates :body, presence: true
end
