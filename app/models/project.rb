class Project < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :image, presence: true

  def set_project_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/project_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
end
