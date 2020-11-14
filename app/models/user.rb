class User < ApplicationRecord
  has_many :interest_levels
  has_many :topics, through: :interest_levels

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]

         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            # uncomment the line below to skip the confirmation emails.
            user.skip_confirmation!
          end
        end

        def email_required?
          false
        end 
        
end
