class Project < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :like_users, through: :likes, source: :user

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, presence: true
  validates :caption, length: { maximum: 50 }

  def set_project_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/project_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end

  class << self
    def search(query)
      rel = order(:created_at)
      if query.present?
        rel = rel.where("title LIKE ? OR caption LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
