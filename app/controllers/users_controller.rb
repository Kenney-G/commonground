class UsersController < ApplicationController
    validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
    validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
    attr_writer :login
    def login
        @login || self.username || self.email
      end
      
      def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
          where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
        elsif conditions.has_key?(:username) || conditions.has_key?(:email)
          where(conditions.to_h).first
        end
      end

    def email_required?
        false
    end
    
    def topic_selection
        render :topic_selection
    end
end    