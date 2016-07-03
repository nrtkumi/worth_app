class Project < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :like_users, through: :likes, source: :user
  has_many :projects
  has_one :room ,dependent: :destroy


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
      # File.open("../#{file_name}", 'wb'){|f| f.write(file.read)}
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

    def category(tag)
      rel = order(:created_at)
      rel = rel.where(business: 1) if tag == "ビジネス"
      rel = rel.where(social: 1) if tag == "社会貢献"
      rel = rel.where(music: 1) if tag == "音楽"
      rel = rel.where(art: 1) if tag == "アート"
      rel = rel.where(event: 1) if tag == "イベント"
      rel = rel.where(product: 1) if tag == "プロダクト"
      rel = rel.where(app: 1) if tag == "アプリ"
      rel = rel.where(game: 1) if tag == "ゲーム"
      rel = rel.where(food: 1) if tag == "フード"
      rel = rel.where(global: 1) if tag == "グローバル"
      rel = rel.where(fashion: 1) if tag == "ファッション"
      rel = rel.where(movie: 1) if tag == "ムービー"
      rel = rel.where(book: 1) if tag == "本"
      rel
    end
  end
end
