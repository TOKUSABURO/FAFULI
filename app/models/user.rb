class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable,
         omniauth_providers: %i(google)

  mount_uploader :profile_image, ImageUploader
  #enable user to be saved with random id
  def self.create_unique_string
    SecureRandom.uuid
  end

  #check if the user exists and find user info from other app
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.new(email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                   )
    end
    user.save
    user
  end
end
