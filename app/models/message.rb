class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :project_id, presence: true
  validates :body, presence: true

  def add_list(user)
    if List.find_by(user_id: user.id, project_id: self.project_id) == nil
      List.create(user_id: user.id, project_id: self.project_id)
    end
  end

end
