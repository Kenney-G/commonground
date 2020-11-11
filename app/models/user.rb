class User < ApplicationRecord
    attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

#extends Devise to query via warden. This uses some SQL to query for either the username or email fields given one or the other is supplied during form submission.
def self.find_for_database_authentication warden_condition
  conditions = warden_condition.dup
    login = conditions.delete(:login)
      where(conditions).where(
        ["lower(username) = :value OR lower(email) = :value",
          { value: login.strip.downcase}]).first
end

end
