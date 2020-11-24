class Interest < ApplicationRecord
    belongs_to :topic
    belongs_to :user

    validates :level, presence: true
end
