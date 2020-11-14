class Topic < ApplicationRecord
    has_many :interest_levels
    has_many :users, through: :interest_levels
end
