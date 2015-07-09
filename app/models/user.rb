class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable
    

  belongs_to :user
  # validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end

