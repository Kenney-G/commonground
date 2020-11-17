class User < ApplicationRecord
  attr_writer :login
  has_many :interests
  has_many :topics, through: :interests
  validates :username, presence: true, uniqueness: { case_sensitive: false }

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:github]
         
         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            # uncomment the line below to skip the confirmation emails.
            user.skip_confirmation!
          end
        end

        #skip email field requirement for username sign in
        def email_required?
          false
        end 
  
        #allow user to sign in using email or username
        def login
          @login || self.username || self.email
        end

        #override default config for searching the database for a user to search for username or email
        def self.find_for_database_authentication(warden_conditions)
          conditions = warden_conditions.dup
          if login = conditions.delete(:login)
            
            where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
          elsif conditions.has_key?(:username) || conditions.has_key?(:email)
            conditions[:email].downcase! if conditions[:email]
            where(conditions.to_h).first
            
          end
          
        end

end
