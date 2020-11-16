class InterestLevel < ApplicationRecord
    belongs_to :user
    belongs_to :topic
        scope :recent, -> { where "created_at DESC", :limit => 10)
end