class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  mount_uploader :avatar, AvatarUploader
  has_many :answers
  has_many :authorizations

  validates :email, presence: true
  validates :password, presence: true

  def email_required?
    false
  end

  def self.find_for_oauth(auth)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s ).first
    return authorization.user if authorization

    auth.info[:email].present? ? email = auth.info[:email] : email = auth.uid + '@facebook.com'
    user = User.where(email: email).first
    if user
      user.create_auth(auth)
    else
      password = Devise.friendly_token[0, 20]
      user = User.create!(email: email, password: password, password_confirmation: password )
      user.create_auth(auth)
    end
    user
  end


  def create_auth(auth)
    self.authorizations.create(provider: auth.provider, uid: auth.uid)
  end

end
