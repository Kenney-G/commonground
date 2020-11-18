require 'pry'
class Interest < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :topic, optional: true

    validates :name, presence: true
    validates_associated :user, :topic
    
    def self.by_user(user)
        where(user_id: user.id)
    end

    def self.by_topic
        where(topic_id: topic.id)
    end

    def self.level
        User.topic.id.interest.id(level = 1)
    end
    


    def self.recent
        order(created_at: :desc)
      end

end