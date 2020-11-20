class InterestsController < ApplicationController
    belongs_to :topic
    belongs_to :user

    validates :level, presence: true

    def creator
        self.user.username
    end
end
