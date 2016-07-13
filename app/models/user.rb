class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  has_many :projects
  has_many :likes
  has_many :like_projects, through: :likes, source: :project
  has_many :messages

  validates :username, presence: true

  def self.from_omniauth(auth)
    where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      type = extension_image(file_name)
      file_name = SecureRandom.urlsafe_base64 + type
      File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end

  def extension_image(name)
    extension = File.extname(name).downcase
    case extension
    when ".jpg"
      return ".jpg"
    when ".jpeg"
      return ".jpeg"
    when ".png"
      return ".png"
    when ".gif"
      return ".gif"
    end
  end
end
