class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]

         def self.from_omniauth(auth)
          user = User.find_by(email: auth.info.email)
          if user
            user.provider = auth.provider
            user.uid = auth.uid
            user.save
          else
            user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
              user.email = auth.info.email
              user.password = Devise.friendly_token[0,20]
              user.first_name = auth.info.name.split(' ').first
              user.last_name = auth.info.name.split(' ').second
            end
          end
          unless user.avatar.present?
            photo_url = auth.info.image
            user.remote_avatar_url = photo_url # Carrierwave helper
            user.save
          end
          user
        end

end
