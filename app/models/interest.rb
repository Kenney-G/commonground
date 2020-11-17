class Interest < ApplicationRecord
    belongs_to :user
    belongs_to :topic

    validates :name, :level, :description, presence: true
    validates_associated :users, :topics
    
    def self.by_user
        where(user_id: user.id)
    end

    def self.by_topic
        where(topic_id: topic.id)
    end

    def self.recent
        order(start_time: :desc)
      end

end