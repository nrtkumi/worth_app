class Room < ActiveRecord::Base
  belongs_to :project
  has_one :owner, through: :project, source: :user
end
