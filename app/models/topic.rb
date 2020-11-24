class Topic < ApplicationRecord
    has_many :interests
    has_many :users, through: :interests

    accepts_nested_attributes_for :interests 
end
